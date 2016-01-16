#!/usr/bin/python

# mftqcd-converter.py - Simple converter from nuclear units to CGS units.
# Copyright (C) 2015 Rodrigo Souza <rsouza01@gmail.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.


import sys
import os
import time

import cgs_constants as const

""""
    Assumes data in the following order:
    rho, x, y, z, w, 
    energia, pressao, energiamit, pressaomit, (pressao/pressaomit), 
    fermie, fermip, hardgluons, nu, nd, 
    ns, ne, nB, muB, muBGibbs
    
    Input data (relevant fields): 
        energy: MeV/fm3         -> erg/cm3
        pressure: MeV/fm3       -> erg/cm3
        baryon density: 1/fm3   -> 1/fm3
        chemical potential: MeV -> erg
        
"""

def main(argv):

    # Zero based indexes.
    ENERGY_DENSITY_COLUMN = 5
    PRESSURE_DENSITY_COLUMN = 6
    BARYON_DENSITY_COLUMN = 0
    CHEM_POTENTIAL_DENSITY_COLUMN = 19

    # Gets all the lines from stdin
    lines = sys.stdin.readlines()
    
    print("# mass density [erg/cm3], pressure  [erg/cm3], baryon density [1/cm3], chemical potential [erg]")

    for line in lines:


        if not line.startswith('#'):
            
            line = line.replace(' ', '').replace('\r\n', '').replace('\n', '').replace('\r', '').replace('\t', ', ')

            fields = [float(i) for i in line.split(',')]
            
            #print(fields)

            MEV_TO_ERG              = 1.6021773e-6
            FM3_TO_CM3              = 1e-39
            LIGHT_SPEED             = 2.998e10

            #mass_density_cgs          = fields[ENERGY_DENSITY_COLUMN] * (MEV_TO_ERG/FM3_TO_CM3)/LIGHT_SPEED**2.
            #pressure_cgs                = fields[PRESSURE_DENSITY_COLUMN] * (MEV_TO_ERG/FM3_TO_CM3)
            #baryon_density_cgs          = fields[BARYON_DENSITY_COLUMN] * (1./FM3_TO_CM3)
            #chem_potential_density_cgs  = fields[CHEM_POTENTIAL_DENSITY_COLUMN] * (MEV_TO_ERG)
            #print("{}, {}, {}, {}".format(mass_density_cgs, pressure_cgs, baryon_density_cgs, chem_potential_density_cgs))

            #Mantem nuclear
            mass_density_nuc          = fields[ENERGY_DENSITY_COLUMN]
            pressure_nuc                = fields[PRESSURE_DENSITY_COLUMN]
            baryon_density_nuc          = fields[BARYON_DENSITY_COLUMN]
            chem_potential_density_nuc  = fields[CHEM_POTENTIAL_DENSITY_COLUMN]

            print("{}, {}, {}, {}".format(mass_density_nuc, pressure_nuc, baryon_density_nuc, chem_potential_density_nuc))


    
if __name__ == "__main__":
    main(sys.argv[1:])
