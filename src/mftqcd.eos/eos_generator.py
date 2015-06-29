#! /usr/bin/python
# -*- coding: UTF-8 -*-

# mftqcd.eos - MFTQCD Equation of State generator
# Copyright (C) 2002015  Rodrigo Alvares de Souza <rsouza01@gmail.com>

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


#================================================
# Authors:  
#		Rodrigo Souza 
#		<rsouza01@gmail.com>
#       2015-06-07
#================================================

import numpy as np
import mftqcd_eos as eos
import scipy.special as scps

import atomic_constants as ac
import qcd
import scipy
import math

from scipy.optimize import fsolve



#================================================
#Constants
#================================================
number_output = 6
output_formaters = "{: >20} "*number_output
    


"""
Quark degeneracy factor
"""

def println(message):
	print message


    
def print_program_header():
    println ("="*125)
    println (" "* 45 + " MFTQCD EOS file generator")
    println ("="*125)

    
def print_header():
        
    header = ["rho", "ku", "kd", "ks", "ke", "bag"]

    separator = "="*20
    separators = [separator] * len(header)

    print(output_formaters.format(*separators))
    print(output_formaters.format(*header))
    print(output_formaters.format(*separators))


def print_footer():
    print_header()   

#================================================
#FUNCTION MAIN
#================================================


def fFuncMain():

    print_program_header()
    print_header()

    print eos.eos_quark_masses

    # divisoes = 36 # original
    divisoes = 10 # pra testes
    for rho in np.linspace(0.15, 0.50, divisoes):
        
        fsolve_parameters = [rho,
                             eos.eos_quark_masses[qcd.Quarks.up.value],
                             eos.eos_quark_masses[qcd.Quarks.down.value],
                             eos.eos_quark_masses[qcd.Quarks.strange.value],
                             eos.electron_mass]

        # ku, kd, ks, ke = fsolve(quarks_momenta, (1, 1, 1, 1), fsolve_parameters).tolist()
        # print rho, ku, kd, ks, ke
        

        k_solution = fsolve(eos.quarks_momenta, (1, 1, 1, .1), fsolve_parameters).tolist()

        dynamic_mass_gluon = 1
        qcd_coupling_g = 1



        # energy = eos.eos_energy(rho, qcd_coupling_g, B_QCD, dynamic_mass_gluon, k_solution)
        # pressure = eos.eos_pressure(rho, qcd_coupling_g, B_QCD, dynamic_mass_gluon, k_solution)
        # print energy, pressure

        # bag_constant = (((nucleons_masses[Nucleons.neutron.value]*rho)-(eq + ee - pq - pe)) /2);
        # energy_minus_pressure = \
        #    (eos.energy_quarks(rho,  k_solution[:3]) + eos.energy_quarks(rho,  k_solution[-1])) - \
        #    (eos.pressure_quarks(rho,  k_solution[:3]) + eos.pressure_quarks(rho,  k_solution[-1]))

        B_QCD = ((nucleons_masses[Nucleons.neutron.value]*rho)-(energy_minus_pressure)) /2.;


        i_line = ([rho] + k_solution + [B_QCD])

        number_output = 6
        output_formaters = "{: >20} " * number_output
        print(output_formaters.format(*i_line))

    print_footer()
