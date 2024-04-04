##################################################
# Sizing of fog generating nozzle
#
# Requires: 
#   * Pandas
#   * Numpy
#   * PDrop (Custom)
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

# Initialize Unit Registry:
u = UnitRegistry()

# Inputs:
target_cav_index = 0.632; #Hiroyasu et. al. Table 1, Boundary of Supercavitation
orifice_diam = 0.6 * u.mm; #Smallest good hole according to Logan on 3D printer
orifice_count = 37; #From https://www.engineeringtoolbox.com/smaller-circles-in-larger-circle-d_1849.html
orifice_CD = 0.98; #Discharge coeffient for a single orifice.

# Fluid properties of Fog Juice (Stolen from HeatWrap Script)
inlet_pres = 101325 * u.Pa;
inlet_temp = 293 * u.K;
outlet_pres = 101325 * u.Pa;

#Chemical Properties from NIST (Coolprop didnt have them): https://webbook.nist.gov/cgi/cbook.cgi?Name=ethane-1%2C2-diol&Units=SI&cTG=on&cTC=on&cTP=on
mol_weight_GLYCL = 62.0678 * u.grams/u.moles;
mol_weight_WATER = 18.0153 * u.grams/u.moles;

sat_temp_WATER = CP.PropsSI('T', 'P', outlet_pres.magnitude, 'Q', 0, 'Water') * u.K;
spec_heat_GLYCL = 218.9 * u.J/u.mol/u.K;
spec_heat_WATER = 75.38 * u.J/u.mol/u.K;

h_vap_GLYCL = 65.6 * u.kilojoules/u.moles; 
h_vap_WATER = (CP.PropsSI('H', 'P', inlet_pres.magnitude, 'Q', 1, 'Water') - CP.PropsSI('H', 'P', inlet_pres.magnitude, 'Q', 0, 'Water')) * u.J/u.kg;

mass_frac_GLYCL = 0.3; #Percent of fluid that is glycol (by mass)
mass_frac_WATER = 1 - mass_frac_GLYCL; #Pct of fluid that is water (by mass)

mole_frac_GLYCL = ((mass_frac_GLYCL / mol_weight_GLYCL) / (mass_frac_WATER / mol_weight_WATER)).magnitude;
mole_frac_WATER = 1 - mole_frac_GLYCL;

rho_WATER = CP.PropsSI('D', 'Q', 0, 'T', inlet_temp.magnitude, 'Water') * u.kg/u.m**3
rho_GLYCL = 1.26 * u.g/u.cm**3;

#Combined Density (mass basis)
rho = rho_WATER * mass_frac_WATER + rho_GLYCL * mass_frac_GLYCL;
rho = rho.to_base_units()

# Mixing:
spec_heat = mole_frac_GLYCL * spec_heat_GLYCL + mole_frac_WATER * spec_heat_WATER;
mol_weight = mole_frac_GLYCL * mol_weight_GLYCL + mole_frac_WATER * mol_weight_WATER;

# Unit Converting (Mole -> Mass)
h_vap_WATER = h_vap_WATER.to_base_units();

p_vap_WATER = CP.PropsSI('P', 'Q', 0, 'T', inlet_temp.magnitude, 'Water') * u.Pa;

spec_heat = spec_heat / mol_weight;
spec_heat = spec_heat.to_base_units();

# Determine overall injector area:
orifice_area = math.pi * (orifice_diam/2)**2
total_orifice_area = orifice_area * orifice_count;

orifice_area = orifice_area.to_base_units();
total_orifice_area = total_orifice_area.to_base_units();

printD(f"Element Diameter: {orifice_diam.to('mm'):.3f}")
printD(f"Element Count: {orifice_count:.3f}")
printD(f"Element Total Area: {total_orifice_area.to('mm**2'):.3f}")

# Calculate the injection pressure for a certain cavitation number:
inj_press = (target_cav_index * p_vap_WATER - outlet_pres) / (target_cav_index  - 1);
orifice_mass_flow = orifice_CD * orifice_area.magnitude * math.sqrt(2.*(inj_press.magnitude - p_vap_WATER.magnitude)) * u.kg/u.sec;
mass_flow = orifice_mass_flow * orifice_count;

printD(f"Injection Pressure: {inj_press:.3f}")
printD(f"Orifice Mass-Flow {orifice_mass_flow.to('g/s'):.3f}")
printD(f"Total Mass-Flow {mass_flow.to('g/s'):.3f}")

## Pressure Drop Stuff:


