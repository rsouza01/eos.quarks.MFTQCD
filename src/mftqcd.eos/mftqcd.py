#! /usr/bin/python
# -*- coding: UTF-8 -*-

# mftqcd.eos - MFTQCD Equation of State generator
# Copyright (C) 2015  Rodrigo Alvares de Souza <rsouza01@gmail.com>

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


# ================================================================================================
# Authors:  
# 		Rodrigo Souza
# 		<rsouza01@gmail.com>
#        2015-06-07
# ================================================================================================

import numpy as np
import mftqcd_eos as eos
import qcd
import cmath
import util

from scipy.optimize import fsolve
import mftqcd_gen as gen

# ================================================================================================
# Constants
# ================================================================================================
number_output = 8
output_formaters = "{: >20} "*number_output
    


"""
Quark degeneracy factor
"""


def println(message):
    print message


def print_program_header(program_function):
    println("=" * 125)
    println(" " * 45 + " MFTQCD EOS file generator - " + str(program_function))
    println("=" * 125)


def print_header():
    header = ["rho", "ku", "kd", "ks", "ke", "B_QCD", "razao", "energiaQCD"]

    separator = "=" * 20
    separators = [separator] * len(header)

    print(output_formaters.format(*separators))
    print(output_formaters.format(*header))
    print(output_formaters.format(*separators))


def print_footer():
    print_header()   




# ================================================================================================
# FUNCTION MAIN
# ================================================================================================


def fFuncMain(function):

    b_qcd = 62
    g_mg_ratio = .003658

    print_program_header(function)

    if function == 0:
        gen.generateEoSTable(b_qcd, g_mg_ratio)
        return

    print_header()

    # divisoes = 36 # original
    divisoes = 5 # pra testes
    for rho in np.linspace(0.15, 0.50, divisoes):
        
        fsolve_parameters = [rho,
                             eos.eos_quark_masses[qcd.Quarks.up.value],
                             eos.eos_quark_masses[qcd.Quarks.down.value],
                             eos.eos_quark_masses[qcd.Quarks.strange.value],
                             eos.electron_mass]

        # particles_momenta = [k_u, k_d, k_s, k_e]
        # TODO: Need to improve precision
        particles_momenta = fsolve(eos.quarks_momenta, (1.1, 1.25, 1, .12), fsolve_parameters).tolist()

        dynamic_mass_gluon = 1
        qcd_coupling_g = 1

        quarks_momenta = np.asarray(particles_momenta[:3])      # [k_u, k_d, k_s]
        electron_momentum = np.asarray(particles_momenta[-1])   # k_e

        # energy = eos.eos_energy(rho, qcd_coupling_g, B_QCD, dynamic_mass_gluon, k_solution)
        # pressure = eos.eos_pressure(rho, qcd_coupling_g, B_QCD, dynamic_mass_gluon, k_solution)
        # print energy, pressure

        pressure_q = eos.pressure_quarks(rho,  quarks_momenta)
        pressure_e = eos.pressure_quarks(rho,  electron_momentum)

        energy_q = eos.energy_quarks(rho,  quarks_momenta)
        energy_e = eos.energy_electrons(rho,  electron_momentum)

        B_QCD = ((eos.neutron_mass*rho)-((energy_q + energy_e) - (pressure_q + pressure_e))) /2.

        razao = cmath.sqrt((B_QCD - (pressure_q + pressure_e))/((27./16.)* eos.fator1*rho**2.))

        energiaQCD = (27/16)* eos.fator1*(razao*razao)*rho*rho + B_QCD + energy_q + energy_e

        i_line = ([rho] +
                  particles_momenta +
                  [B_QCD] +
                  [util.format_imaginary_to_real(razao)] +
                  [util.format_imaginary_to_real(energiaQCD/rho)])

        print(output_formaters.format(*i_line))

    print_footer()
