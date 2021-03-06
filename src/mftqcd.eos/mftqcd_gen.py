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
# header = ["rho", "energy", "pressure", "mu_B", "n_u", "n_d", "n_s", "n_e", "k_i"]
header = ["energy", "pressure", "rho", "mu_B", "quark_s_fraction"]

number_output = len(header)

output_formaters_header = "{: >20} " * number_output
output_formaters = "{: >20}," * number_output


def print_header():
    separator = "=" * 20
    separators = [separator] * len(header)

    print("#"+output_formaters_header.format(*separators))
    print("#"+output_formaters_header.format(*header))
    print("#"+output_formaters_header.format(*separators))


def print_footer():
    print_header()


def get_quarks_density(particles_momenta):

    gammaq = 2.

    fator = (gammaq/(2*cmath.pi**2.))

    n_u = fator * particles_momenta[0]**3
    n_d = fator * particles_momenta[1]**3
    n_s = fator * particles_momenta[2]**3

    return n_u, n_d, n_s


def generateEoSTable(b_qcd, g_mg_ratio):

    print_header()

    steps = 45  # original
    # steps = 10 # pra testes
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
        init_guess = [3., 3., 3., 0.04]

        particles_momenta = sc.fsolve(
            func=eos.quarks_momenta,
            x0=init_guess,
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

        chem_potential_factor = 2.5

        chem_potential = chem_potential_factor * (energy + pressure)/rho

        n_u, n_d, n_s = get_quarks_density(particles_momenta)

        n_B = (n_u + n_d + n_s)/3

        fraction_quark_s = n_s / n_B

        # i_line = ([rho] +
        #           [energy] +
        #           [pressure] +
        #           [chem_potential]
        #           # + particles_density +[str(particles_momenta)]
        #           )

        print("%f, %f, %f, %f, %f" % (
            energy, pressure, rho, chem_potential, fraction_quark_s))

        # print(output_formaters.format(*i_line))

    print_footer()
