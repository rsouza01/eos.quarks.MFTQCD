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
number_output = 2
output_formaters = "{: >20} "*number_output

def generateEoSTable(b_qcd, dynamic_mass_gluon):

    print "generateEoSTable()"

    gh = dynamic_mass_gluon * .003658


    divisoes = 441 # original
    #divisoes = 10 # pra testes
    for rho in np.linspace(0.10, 4.50, divisoes):

        fsolve_parameters = [rho,
                             eos.eos_quark_masses[qcd.Quarks.up.value],
                             eos.eos_quark_masses[qcd.Quarks.down.value],
                             eos.eos_quark_masses[qcd.Quarks.strange.value],
                             eos.electron_mass]
        # particles_momenta = [k_u, k_d, k_s, k_e]
        # TODO: Need to improve precision
        particles_momenta = fsolve(eos.quarks_momenta, (1.1, 1.25, 1, .12), fsolve_parameters).tolist()
        # particles_momenta = [1.1, 1.25, 1, .12]

        quarks_momenta = np.asarray(particles_momenta[:3])      # [k_u, k_d, k_s]
        electron_momentum = np.asarray(particles_momenta[-1])   # k_e

        pressure_q = eos.pressure_quarks(rho,  quarks_momenta)
        pressure_e = eos.pressure_quarks(rho,  electron_momentum)

        energy_q = eos.energy_quarks(rho,  quarks_momenta)
        energy_e = eos.energy_electrons(rho,  electron_momentum)

        fermip = pressure_e + pressure_q
        fermie = energy_e + energy_q

        hardgluons = (27/(16)) * eos.fator1*((gh**2.)/(dynamic_mass_gluon*82.))*rho**2.

        pressaomit = - b_qcd + fermip
        energiamit = - b_qcd + fermie

        # Speed of sound
        csoq = pressaomit / energiamit


        i_line = ([rho] + [pressure_q + pressure_e])

        print(output_formaters.format(*i_line))

