##################################################
#  Pressure Drop Helper Functions
# Cleaned up the pressure drop code here for use in cold-flow: 
# https://github.com/Purdue-Space-Program/PSPL_CMS_Fluids/tree/main/NEW%20Press%20Drop
# 
# Author: daddy cool and leon and avidh
# Subteam: Fluids 
# Last Updated: Mar 2024
#
# Requires: 
#   * CoolProp
#   * Fluids
#   * Pint
##################################################

from fluids import fittings
from fluids import core
from CoolProp import CoolProp as CP
from pint import UnitRegistry
import math

# Please go to the following websites for documentation on the used pressure drop code.
# - https://fluids.readthedocs.io/fluids.fittings.html
# - https://fluids.readthedocs.io/fluids.fittings.html#module-fluids.fittings
# - https://fluids.readthedocs.io/tutorial.html#pressure-drop-through-piping

# Initializes SI (mks = meter, kg, second) unit registry:
units = UnitRegistry(system='mks');


def pipe_dp_factors(outerD, wallThk, Ar, mDot, rho, kineVisc):
    """
    Pipe Factors for Pressure Drop

    Args:
        outerD: Tube Outer Diameter
        wallThk: Tube Wall Thickness
        Ar: Average Surface Roughness
        mDot: Mass Flow Rate
        rho: Fluid Density
        kineVisc: Kinematic Viscosity
    Returns:
        Re: Reynolds number
        fd: Friction Factor
        innerD: Tube Inner Diameter
        lineVel: Tube Line Velocity
    """
    # Unit Check, convert all to SI:
    outerD = outerD.to_base_units();
    wallThk = wallThk.to_base_units();
    Ar = Ar.to_base_units();
    mDot = mDot.to_base_units();
    rho = rho.to_base_units();
    kineVisc = kineVisc.to_base_units(); 

    # Pipe Factors for Pressure Drop 
    # Pipe Properties
    innerD = outerD - 2 * wallThk 
    area = math.pi * (innerD / 2)**2

    lineVel = mDot / (rho * area)
    eD = Ar/innerD # Epsilon(Surface Roughness)/Diameter [unitless]

    Re = core.Reynolds(D=innerD.magnitude, V=lineVel.magnitude, nu=kineVisc.magnitude)
    fd = fittings.friction_factor(Re, eD=eD.magnitude)

    return Re, fd, innerD, lineVel

def findDp(K, lineVel, rho):
    """
    Calculate Pressure Drop from K value
    
    Args:
        K: K Value
        lineVel: Line Velocity
        rho: Fluid Density
    """

    # Unit check:
    K = K; #Dimensionless
    lineVel = lineVel.to_base_units();
    rho = rho.to_base_units();

    #print('Line Vel: {lineVel}\tRho: {rho}')

    # Grabs Pressure Drop from K value
    return core.dP_from_K(K, rho=rho.magnitude, V=lineVel.magnitude)

def findDp(K, outerD, wallThk, mDot, rho):
    """
    Calculate Pressure Drop from K value
    
    Args:
        K: K Value
        outerD: Tube Outer Diameter
        wallThk: Tube Wall Thickness
        mDot: Mass Flow Rate
        rho: Fluid Density
    """
    # Unit check:
    K = K #Dimensionless
    outerD = outerD.to_base_units()
    wallThk = wallThk.to_base_units()
    mDot = mDot.to_base_units()
    rho = rho.to_base_units()

    innerD = outerD - 2 * wallThk 
    area = math.pi * (innerD / 2)**2

    lineVel = mDot / (rho * area)

    #print(f'Line Vel: {lineVel}\tRho: {rho}\tArea: {area}')
    
    return core.dP_from_K(K, rho=rho.magnitude, V=lineVel.magnitude) * units.pascals

def tubeK(length, outerD, wallThk, Ar, mDot, rho, kineVisc):
    """
    Find K value for a straight tube

    Args:
        length: Tube Length
        outerD: Tube Outer Diameter
        wallThk: Tube Wall Thickness
        Ar: Tube Avg. Surface Roughness
        mDot: Mass Flow Rate
        rho: Fluid Density
        kineVisc: Kinematic Viscosity
    """

    # Unit Check, convert all to SI:
    length = length.to_base_units();
    outerD = outerD.to_base_units();
    wallThk = wallThk.to_base_units();
    Ar = Ar.to_base_units();
    mDot = mDot.to_base_units();
    rho = rho.to_base_units();
    kineVisc = kineVisc.to_base_units(); 

    # Get Pipe Pressure Drop Properties
    (Re, fd, innerD, lineVel) = pipe_dp_factors(outerD, wallThk, Ar, mDot, rho, kineVisc);

    # Calculates K values of tube straight length
    return core.K_from_f(fd=fd, L = length.magnitude, D = innerD.magnitude)

def bendK(angle, radius, outerD, wallThk, Ar, mDot, rho, kineVisc):
    """
    Find K value for a tube bend

    Args:
        angle: Angle of bend
        radius: Radius of bend
        outerD: Tube Outer Diameter
        wallThk: Tube Wall Thickness
        Ar: Tube Avg. Surface Roughness
        mDot: Mass Flow Rate
        rho: Fluid Density
        kineVisc: Kinematic Viscosity
    """

    # Unit Check, convert all to SI:
    angle = angle.to_base_units();
    radius = radius.to_base_units();
    outerD = outerD.to_base_units();
    wallThk = wallThk.to_base_units();
    Ar = Ar.to_base_units();
    mDot = mDot.to_base_units();
    rho = rho.to_base_units();
    kineVisc = kineVisc.to_base_units(); 

    # Get Pipe Pressure Drop Properties
    (Re, fd, innerD, lineVel) = pipe_dp_factors(outerD, wallThk, Ar, mDot, rho, kineVisc);

    K = fittings.bend_rounded(innerD.magnitude, angle.magnitude, fd = fd, rc=radius.magnitude, Re = Re, method = "Crane")
    return K

def ballValveK(innerD, Cv):

    """
    Find K value for a valve

    Args:
        innerD: Valve Inner Diameter
        Cv: Valve Flow Coefficient
    """

    # Unit Check: Convert all to SI:
    innerD = innerD.to_base_units();
    Cv = Cv; #Dimensionless

    return fittings.Cv_to_K(Cv = Cv, D = innerD.magnitude)

def roundedEntranceK(innerD, radius):
    """
    Finds K Value for a rounded entrance

    Args:
        innerD: Entrance Inner Diameter
        radius: Radius of Curvature of entrance
    """

    # Unit Check: Convert all to SI:
    innerD = innerD.to_base_units();
    radius = radius.to_base_units();

    return fittings.entrance_rounded(Di=innerD.magnitude, rc=radius.magnitude, method='Crane')

def sharpContractionK(largeID, smallID, largeOD, wallThk, Ar, mDot, rho, kineVisc):
    """
    Finds K Value for a sharp contraction.

    Args:
        largeID: Inner Diameter of original (larger) tube
        smallID: Inner Diameter of following (smaller) tube
        largeOD: Tube Outer Diameter (original tube!)
        wallThk: Tube Wall Thickness (original tube!)
        Ar: Tube Avg. Surface Roughness
        mDot: Mass Flow Rate
        rho: Fluid Density
        kineVisc: Kinematic Viscosity
    """
    # Unit Check: Convert all to SI:
    largeID = largeID.to_base_units();
    smallID = smallID.to_base_units();
    largeOD = largeOD.to_base_units();
    wallThk = wallThk.to_base_units();
    Ar = Ar.to_base_units();
    mDot = mDot.to_base_units();
    rho = rho.to_base_units();
    kineVisc = kineVisc.to_base_units();


    # Get Pipe Pressure Drop Properties
    (Re, fd, innerD, lineVel) = pipe_dp_factors(largeOD, wallThk, Ar, mDot, rho, kineVisc);

    return fittings.contraction_sharp(Di1 = largeID.magnitude, Di2 = smallID.magnitude, 
                                      fd = fd, Re = Re, method = 'Rennels')

def sharpExpansionK(smallID, largeID, smallOD, wallThk, Ar, mDot, rho, kineVisc):
    """
    Finds K Value for a sharp expansion.

    Args:
        smallID: Inner Diameter of original (smaller) tube
        largeID: Inner Diameter of following (larger) tube
        smallOD: Tube Outer Diameter (original tube!)
        wallThk: Tube Wall Thickness (original tube!)
        Ar: Tube Avg. Surface Roughness
        mDot: Mass Flow Rate
        rho: Fluid Density
        kineVisc: Kinematic Viscosity
    """

    # Unit Check: Convert all to SI:
    smallID = smallID.to_base_units();
    largeID = largeID.to_base_units();
    smallOD = smallOD.to_base_units();
    wallThk = wallThk.to_base_units();
    Ar = Ar.to_base_units();
    mDot = mDot.to_base_units();
    rho = rho.to_base_units();
    kineVisc = kineVisc.to_base_units();

    # Get Pipe Pressure Drop Properties
    (Re, fd, innerD, lineVel) = pipe_dp_factors(smallOD, wallThk, Ar, mDot, rho, kineVisc);

    return fittings.diffuser_sharp(Di1 = smallID.magnitude, Di2 = largeID.magnitude, 
                                   fd = fd, Re = Re, method = 'Rennels') 

def sharpEntranceK():
    """
    Finds K value for a sharp entrance (like a tank entrance)

    """

    return fittings.entrance_sharp(method = 'Rennels')