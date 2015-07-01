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


import numpy as np
import qcd
import math


# ================================================================================================
# CONSTANTS
# ================================================================================================

eos_quark_masses = qcd.quark_masses[:3]
electron_mass = qcd.lepton_masses[qcd.Leptons.electron.value]
neutron_mass = qcd.nucleons_masses[qcd.Nucleons.neutron.value]


fator_quarks = 1./3.
fator_eletrons = 1./3.

fator1 = 1./((5.07e-3)**3.)
fator2 = 1./(5.07e-3)

# ================================================================================================
# FUNCTIONS
# ================================================================================================

def mu(K_F_i, m_i):
	return np.sqrt(K_F_i**2. + m_i ** 2.)

"""
Energy
"""

def eos_energy(rho, qcd_coupling_g, B_QCD, dynamic_gluon_mass, quarks_momenta, electron_momentum):

    varepsilon = (fator1 * 27. * qcd_coupling_g ** 2. / (16 * dynamic_gluon_mass ** 2.)) * rho ** 2. + \
                 B_QCD + \
                 energy_quarks(rho, quarks_momenta) + \
                 energy_electrons(rho, electron_momentum)  # last item

    return varepsilon


def energy_quarks(rho, quark_momenta):
    gamma_Q = 6.

    mu_quarks = mu(quark_momenta, eos_quark_masses)

    varepsilon = fator_quarks * 3. * gamma_Q / (2. * math.pi ** 2.) * fator2 * \
                 np.sum(
                     quark_momenta ** 3. * mu_quarks / 4. +
                     eos_quark_masses ** 2. * quark_momenta * mu_quarks / 8. -
                     eos_quark_masses ** 4. / 8. * np.log(quark_momenta + mu_quarks) +
                     (eos_quark_masses ** 4. / 16.) * np.log(eos_quark_masses ** 2.))

    return varepsilon


def energy_electrons(rho, electron_momentum):

    gamma_E = 2.

    mu_electron = mu(electron_momentum, electron_mass)

    varepsilon = gamma_E / (2. * math.pi ** 2.) * fator2 *\
                 (
                     electron_momentum ** 3. * mu_electron / 4. +
                     electron_mass ** 2. * electron_momentum * mu_electron / 8. -
                     (electron_mass ** 4. / 8.) * np.log(electron_momentum + mu_electron) +
                     (electron_mass ** 4. / 16.) * np.log(electron_mass ** 2.))

    return varepsilon


"""
Pressure
"""

def eos_pressure(rho, qcd_coupling_g, B_QCD, dynamic_gluon_mass, quarks_momenta, electron_momentum):

    pressure = (27. * qcd_coupling_g ** 2. / (16 * dynamic_gluon_mass ** 2.)) * rho ** 2. - \
                 B_QCD + \
                pressure_quarks(rho, quarks_momenta) + pressure_electron(rho, electron_momentum)
                     
    return pressure
    
    
def pressure_quarks(rho, quark_momenta):

    gamma_Q = 6.

    mu_quarks = mu(quark_momenta, eos_quark_masses)
    
    pressure = fator_quarks * gamma_Q / (2. * math.pi ** 2.) * fator2 * \
        np.sum(
        quark_momenta ** 3. * mu_quarks / 4. -
        3.*eos_quark_masses ** 2. * quark_momenta * mu_quarks / 8. + \
        3.*eos_quark_masses ** 4. / 8. * np.log(quark_momenta + mu_quarks) - \
        (3.*eos_quark_masses ** 4. / 16.) * np.log(eos_quark_masses ** 2.))

    return pressure

def pressure_electron(rho, electron_momentum):

    gamma_E = 2.
    
    mu_electron = mu(electron_momentum, electron_mass)

    pressure = gamma_E / (6. * math.pi ** 2.) * fator2 * \
        ( \
            electron_momentum ** 3. * mu_electron / 4. - \
            3.*electron_mass ** 2. * electron_momentum * mu_electron / 8. + \
            3.*electron_mass ** 4. / 8. * np.log(electron_momentum + mu_electron) - \
            (3.*electron_mass ** 4. / 16.) * np.log(electron_mass ** 2.))


    return pressure

def quarks_momenta(p, parameters):

    # Variaveis
    ku, kd, ks, ke = p

    # Parametros
    rho, mu, md, ms, me = parameters

    # Lista de 
    return (
        ku**3 + kd**3 + ks**3 - 3*math.pi**2 * rho,
        2*ku**3 - kd**3 - ks**3 - ke**3, 
        kd**2 + md**2 -  ks**2 - ms**2, 
        (ku**2 + mu**2)**(.5)  + (ke**2 + me**2)**(.5) - (ks**2 + ms**2)**(.5)
    )

