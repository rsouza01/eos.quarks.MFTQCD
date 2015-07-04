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
import scipy as sc
import util
from scipy import optimize

import scipy.optimize as sc

# ================================================================================================
# Constants
# ================================================================================================
header = ["rho", "energy", "pressure", "n_B", "mu_B", "n_u", "n_d", "n_s", "n_e"]

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

        quarks_momenta_parameters = [rho,
            eos.eos_quark_masses[qcd.Quarks.up.value],
            eos.eos_quark_masses[qcd.Quarks.down.value],
            eos.eos_quark_masses[qcd.Quarks.strange.value],
            eos.electron_mass]

        print quarks_momenta_parameters

        initGuess = optimize.fmin(
            func=eos.quarks_momenta,
            x0=(2, 2, 2, 0.07),
            args=tuple(quarks_momenta_parameters))

        initGuess = (2, 2, 2, 0.07)

        # particles_momenta = [k_u, k_d, k_s, k_e]
        particles_momenta = sc.fsolve(
            func=eos.quarks_momenta,
            x0=initGuess,
            args=(rho,
            eos.eos_quark_masses[qcd.Quarks.up.value],
            eos.eos_quark_masses[qcd.Quarks.down.value],
            eos.eos_quark_masses[qcd.Quarks.strange.value],
            eos.electron_mass))


        # 4.5	4331.38 3682.455 <= devia ser assim
        # 4.5  10745.6854205      5773.05091956 <= está vindo assim

        quarks_momenta = np.asarray(particles_momenta[:3])      # [k_u, k_d, k_s]
        electron_momentum = np.asarray(particles_momenta[-1])   # k_e

        # Solução do sistema com rho = 4.5
        # quarks_momenta = np.asarray([2.01, 2.08, 1.93])      # [k_u, k_d, k_s]
        # electron_momentum = np.asarray(0.07)   # k_e


        # print "Momenta = " + str(quarks_momenta) + str(electron_momentum)

        # pressure_q = eos.pressure_quarks(rho,  quarks_momenta)
        # pressure_e = eos.pressure_quarks(rho,  electron_momentum)
        pressure = eos.eos_pressure(rho, b_qcd, g_mg_ratio, quarks_momenta, electron_momentum)

        # energy_q = eos.energy_quarks(rho,  quarks_momenta)
        # energy_e = eos.energy_electrons(rho,  electron_momentum)
        energy = eos.eos_energy(rho, b_qcd, g_mg_ratio, quarks_momenta, electron_momentum)

        particles_density = (1/(cmath.pi**3.) * np.asarray(particles_momenta)).tolist()

        # print particles_density

        str_momenta = " ".join("{0:.4f}".format(momentum) for momentum in particles_density)

        particles_density_formated = ("{0:.4f}"*4).format(*particles_density)

        # print particles_density_formated
        # i_line = [1, 2, 3,4, 5, 6, 7]
        n_baryons = np.sum(particles_density[0:3])

        chem_potential = (energy + pressure)/(n_baryons**2.)

        i_line = ([rho] +
                  [energy] +
                  [pressure] +
                  [n_baryons] +
                  [chem_potential] +
                  particles_density
                  )

        print(output_formaters.format(*i_line))

    print_footer()