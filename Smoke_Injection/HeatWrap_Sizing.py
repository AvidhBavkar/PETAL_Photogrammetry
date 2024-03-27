from CoolProp import CoolProp as CP
from pint import UnitRegistry
import math

# Initialize Unit Registry:WATEWATERR
u = UnitRegistry()

# Inlet Properties:
inj_vol_flow_rate =  2 * u.centimeter**3/u.seconds; #Smoke Volumetric Flow Rate
#inj_flow_velocity = 1 * u.meters/u.seconds; #Speed of flow injected into the chamber.
inlet_pres = 101325 * u.pa;
inlet_temp = 293 * u.K;
outlet_pres = 101325 * u.pa;
outlet_temp = 293 * u.K;

# Tube Properties
tube_ID = 0.25 * u.inches;
tube_OD = 0.50 * u.inches;
tube_length = 5 * u.ft; 

tube_area = math.pi * (tube_ID/2)**2;
tube_area = tube_area.to_base_units();
tube_length = tube_length.to_base_units();

tape_width = 0.5 * u.inches;
tape_width = tape_width.to_base_units();

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

rho_STEAM = CP.PropsSI('D', 'Q', 1, 'P', outlet_pres.magnitude, 'Water') * u.kg/u.meters**3;
rho_GLYCL = 1.26 * u.g/u.cm**3;

# Mixing:
spec_heat = mole_frac_GLYCL * spec_heat_GLYCL + mole_frac_WATER * spec_heat_WATER;
mol_weight = mole_frac_GLYCL * mol_weight_GLYCL + mole_frac_WATER * mol_weight_WATER;

# Unit Converting (Mole -> Mass)
#h_vap_WATER = h_vap_WATER / mol_weight_WATER; #Convert to per mass basis
h_vap_WATER = h_vap_WATER.to_base_units();

spec_heat = spec_heat / mol_weight;
spec_heat = spec_heat.to_base_units();

#Energy Required to bring the mixture up to steam temperature, plus the energy required for the phase change of water itself:
q_vap = spec_heat*(sat_temp_WATER-inlet_temp) + h_vap_WATER * mass_frac_WATER;

print("Mixture: ")
print(f"\tMass Ratio (Glycol:Water): {mass_frac_GLYCL:.2f} : {mass_frac_WATER:.2f}")
print(f"\tMole Ratio (Glycol:Water): {mole_frac_GLYCL:.2f} : {mole_frac_WATER:.2f}")
print(f"\tMolecular Weight: {mol_weight.to('g/mol'):.2f}")
print(f"\tSpecific Heat Capacity: {spec_heat.to('kJ/kg/K'):.2f}")
print("Thermodynamics: ")
print(f"\tEnthalphy of Vaporization (Water): {h_vap_WATER.to('kJ/kg'):.2f}")
print(f"\tSaturation Temperature (Water): {sat_temp_WATER:.2f}");
print(f"\tSpecific Heating Req: {q_vap.to('kJ/kg'):.2f}")

rho_vap = rho_STEAM * mass_frac_WATER + rho_GLYCL * mass_frac_GLYCL;
mass_flow_rate = rho_vap * inj_vol_flow_rate;

watts_req = mass_flow_rate * q_vap;

# Heat Tape Wrapping Logic:
tape_per_tube_length = (math.pi * tube_OD) / tape_width;

tape_length = tube_length * tape_per_tube_length;

watts_per_tube_length = watts_req/tube_length;
watts_per_tape_length = watts_req/tape_length;

print(f"Heat Wrap Sizing:")
print(f"\tLiquid Mass Flow Rate: {mass_flow_rate.to('g/s'):.3f}");
print(f"\tTube Length: {tube_length.to('ft'):.3f}");
print(f"\tMaximum Tape Length: {tape_length.to('ft'):.3f}");
print(f"\tRequired Total Wattage: {watts_req.to('W'):.3f}");
print(f"\tRequired Tape Watt Density: {watts_per_tape_length.to('W/ft'):.3f}");


# Now choosing a McMaster Product, we will work backwards:
watts_per_tape_length = 36 * u.W/u.ft;
tape_length = 14 * u.ft;

watts_avail = tape_length * watts_per_tape_length;
mass_flow_rate = watts_avail/q_vap;
inj_vol_flow_rate = mass_flow_rate/rho_vap;

print(f"GIVEN: Heat Wrap, how much smoke?")
print(f"\tGiven Watt Density: {watts_per_tape_length:.2f}")
print(f"\tGiven Tape Length: {tape_length:.2f}")
print(f"\tTape Wattage: {watts_avail:.2f}")
print(f"\tAchievable Mass Flow Rate: {mass_flow_rate.to('g/s'):.2f}")
print(f"\tAchievable Fog Volume: {inj_vol_flow_rate.to('cm**3/s'):.2f}")

