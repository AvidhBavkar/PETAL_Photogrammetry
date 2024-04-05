##################################################
# Sizing of fog generating nozzle
#
# Requires: 
#   * Pandas
#   * Numpy
#   * PDrop_Functions (Custom)
#   * CoolProp
#   * time
##################################################

# Debug stuff:
global debug
debug = True
def printD(string): 
    if(debug):
        print(string);

from CoolProp import CoolProp as CP
from pint import UnitRegistry
import math
import time
import PDrop_Functions as PDrop


# Initialize Unit Registry (use the pdrop one)
u = PDrop.units

# Inputs:
target_cav_index = 0.632; #Hiroyasu et. al. Table 1, Boundary of Supercavitation
orifice_diam = 0.6 * u.mm; #Smallest good hole according to Logan on 3D printer
orifice_count = 37; #From https://www.engineeringtoolbox.com/smaller-circles-in-larger-circle-d_1849.html
orifice_CD = 0.98; #Discharge coeffient for a single orifice.

iterations = 3;

while (iterations > 0):
    printD(f"-----------ITERATIONS LEFT:{iterations}-----------")
    # Fluid properties of Fog Juice:
    inlet_pres = 101325 * u.Pa; #Starting value, will iterate it.
    inlet_temp = 293 * u.K;
    outlet_pres = 101325 * u.Pa;

    #Chemical Properties from NIST (Coolprop didnt have them): https://webbook.nist.gov/cgi/cbook.cgi?Name=ethane-1%2C2-diol&Units=SI&cTG=on&cTC=on&cTP=on
    mol_weight_GLYCL = 62.0678 * u.grams/u.moles;
    mol_weight_WATER = 18.0153 * u.grams/u.moles;

    vap_pres_WATER = CP.PropsSI('P', 'Q', 0, 'T', inlet_temp.magnitude, 'Water') * u.Pa;
    dynVisc_WATER = CP.PropsSI('V', 'P', vap_pres_WATER.magnitude, 'Q', 0, 'Water') * u.kg/u.m/u.sec

    dynVisc_GLYCL = 0.270 * u.kg/u.m/u.sec;

    spec_heat_GLYCL = 218.9 * u.J/u.mol/u.K;
    spec_heat_WATER = 75.38 * u.J/u.mol/u.K;

    mass_frac_GLYCL = 0.3; #Percent of fluid that is glycol (by mass)
    mass_frac_WATER = 1 - mass_frac_GLYCL; #Pct of fluid that is water (by mass)

    mole_frac_GLYCL = ((mass_frac_GLYCL / mol_weight_GLYCL) / (mass_frac_WATER / mol_weight_WATER)).magnitude;
    mole_frac_WATER = 1 - mole_frac_GLYCL;

    rho_WATER = CP.PropsSI('D', 'Q', 0, 'T', inlet_temp.magnitude, 'Water') * u.kg/u.m**3
    rho_GLYCL = 1.26 * u.g/u.cm**3;

    rho_GLYCL = rho_GLYCL.to_base_units();

    kineVisc_WATER = dynVisc_WATER / rho_WATER;
    kineVisc_GLYCL = dynVisc_GLYCL / rho_GLYCL;

    #Combined Density (mass basis)
    rho = rho_WATER * mass_frac_WATER + rho_GLYCL * mass_frac_GLYCL;
    rho = rho.to_base_units()

    #Combined Kinematic Viscosity (mole basis: Gambill 1959 Correlation):
    kineVisc = (mole_frac_WATER * (kineVisc_WATER)**(1/3) + mole_frac_GLYCL * (kineVisc_GLYCL) ** (1/3))**3;

    # Determine overall injector area:
    orifice_area = math.pi * (orifice_diam/2)**2
    total_orifice_area = orifice_area * orifice_count;

    orifice_area = orifice_area.to_base_units();
    total_orifice_area = total_orifice_area.to_base_units();

    printD(f"Element Diameter: {orifice_diam.to('mm'):.3f}")
    printD(f"Element Count: {orifice_count:.3f}")
    printD(f"Element Total Area: {total_orifice_area.to('mm**2'):.3f}")

    # Calculate the injection pressure for a certain cavitation number:
    inj_press = (target_cav_index * vap_pres_WATER - outlet_pres) / (target_cav_index  - 1);
    orifice_mass_flow = orifice_CD * orifice_area.magnitude * math.sqrt(2.*(inj_press.magnitude - vap_pres_WATER.magnitude)) * u.kg/u.sec;
    mass_flow = orifice_mass_flow * orifice_count;

    printD(f"Injection Pressure: {inj_press:.3f}")
    printD(f"Orifice Mass-Flow {orifice_mass_flow.to('g/s'):.3f}")
    printD(f"Total Mass-Flow {mass_flow.to('g/s'):.3f}")

    ## Pressure Drop Stuff:
    # Sharp Entrance -> 1/4"ID Line -> 5' 90 degree bend -> Sharp Expansion to 1/2"
    line_ID = 0.25 * u.inches;
    line_length = 5 * u.feet;
    line_AR = 0.001 * 3 * u.inches; #Rule of thumb: multiply the smooth line AR by three for braided line?
    line_bend_radius = 2 * line_length / math.pi;

    inj_ID = 0.5 * u.inches;

    tankEntranceK = PDrop.sharpEntranceK();
    runlineK = PDrop.bendK(90 * u.degrees, line_bend_radius, line_ID, 0*u.mm,  line_AR, mass_flow, rho, kineVisc);
    dischargeK = PDrop.sharpExpansionK(line_ID, inj_ID, line_ID, 0*u.mm, line_AR, mass_flow, rho, kineVisc);

    totalK = tankEntranceK + runlineK + dischargeK;
    pressure_loss = PDrop.findDp(totalK, line_ID, 0*u.mm, mass_flow, rho);

    printD(f"Pressure Loss {pressure_loss.to('psi'):.3f}");

    inlet_pres = inj_press - pressure_loss;
    iterations -= 1;

# Outputs:
print("Outputs:")
print(f"\tFluid Properties")
print(f"\t\tFluid Density: {rho:.3f}")
print(f"\t\tWater Vapor Pressure: {vap_pres_WATER:.3f}")
print(f"\t\tFluid Kinematic Viscosity: {kineVisc.to('cm**2/s'):.3f}")
print(f"\t\tMass Ratio (Glycol:Water): {mass_frac_GLYCL:.2f} : {mass_frac_WATER:.2f}")
print(f"\t\tMole Ratio (Glycol:Water): {mole_frac_GLYCL:.2f} : {mole_frac_WATER:.2f}")
print(f"\tPressures:")
print(f"\t\tOrifice Diameter: {orifice_diam.to('mm'):.3f}")
print(f"\t\tOrifice Area: {orifice_area.to('mm**2'):.3f}")
print(f"\t\tOrifice Count: {orifice_count}")
print(f"\t\tTotal Area: {total_orifice_area.to('mm**2'):.3f}")
print(f"\t\tCavitation Index: {target_cav_index}")
print(f"\t\tTunnel Pressure: {outlet_pres:.3f}")
print(f"\t\tInjector Face Pressure: {inj_press.to('bar'):.3f}")
print(f"\t\tOrifice Mass Flow {orifice_mass_flow.to('g/s'):.3f}")
print(f"\t\tTotal Mass Flow {mass_flow.to('g/s'):.3f}")
print(f"\t\tFeed System Pressure Drop: {pressure_loss:.3f}")
print(f"\t\tTank Pressure: {(pressure_loss + inj_press).to('bar'):.3f}")
print(f"\t\tTank Pressure: {(pressure_loss + inj_press).to('psi'):.3f}")
