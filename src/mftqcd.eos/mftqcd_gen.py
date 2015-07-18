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

import scipy.optimize as sc

# ================================================================================================
# Constants
# ================================================================================================
header = ["rho", "energy", "pressure", "mu_B", "n_u", "n_d", "n_s", "n_e", "k_i"]

number_output = len(header)

output_formaters = "{: >20} " * number_output

def print_header():
    separator = "=" * 20
    separators = [separator] * len(header)

    print(output_formaters.format(*separators))
    print(output_formaters.format(*header))
    print(output_formaters.format(*separators))


def print_footer():
    print_header()


def generateEoSTable(b_qcd, g_mg_ratio):

    print_header()

    # steps = 441 # original
    steps = 10 # pra testes
    # for rho in np.linspace(0.15, .36, 21):
    # for rho in np.linspace(0.10, 4.5, divisoes):
    for rho in np.linspace(4.5, 0.10, steps):

        eos.rho_global = rho

        quarks_momenta_parameters = [
            rho,
            eos.eos_quark_masses[qcd.Quarks.up.value],
            eos.eos_quark_masses[qcd.Quarks.down.value],
            eos.eos_quark_masses[qcd.Quarks.strange.value],
            eos.electron_mass]

        # Esse init guess funciona para todos os rho's dentro do range.
        initGuess = [3., 3., 3., 0.04]

        particles_momenta = sc.fsolve(
            func=eos.quarks_momenta,
            x0=initGuess,
            args=quarks_momenta_parameters)

        quarks_momenta = np.asarray(particles_momenta[:3])      # [k_u, k_d, k_s]
        electron_momentum = np.asarray(particles_momenta[-1])   # k_e

        # pressure_q = eos.pressure_quarks(rho,  quarks_momenta)
        # pressure_e = eos.pressure_quarks(rho,  electron_momentum)
        pressure = eos.eos_pressure(rho, b_qcd, g_mg_ratio, quarks_momenta, electron_momentum)

        # energy_q = eos.energy_quarks(rho,  quarks_momenta)
        # energy_e = eos.energy_electrons(rho,  electron_momentum)
        energy = eos.eos_energy(rho, b_qcd, g_mg_ratio, quarks_momenta, electron_momentum)

        particles_density = (1/(cmath.pi**3.) * np.asarray(particles_momenta)).tolist()

        str_momenta = " ".join("{0:.4f}".format(momentum) for momentum in particles_density)

        particles_density_formated = ("{0:.4f}"*4).format(*particles_density)

        chem_potential = (energy + pressure)/(rho)

        i_line = ([rho] +
                  [energy] +
                  [pressure] +
                  [chem_potential] +
                  particles_density +
                  [str(particles_momenta)]
                  )

        print(output_formaters.format(*i_line))

    print_footer()