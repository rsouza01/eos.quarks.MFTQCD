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

rho_global = 0

fator_quarks = 1./3.
fator_eletrons = 1./3.

fator1 = 1./(5.07e-3**3.)
fator2 = 1./5.07e-3

gamma_Q = 2.
gamma_E = 2.

# ================================================================================================
# FUNCTIONS
# ================================================================================================

def mu(k, m):
    """
    Calculates the chemical potential.

    :param k: Momemtum vector
    :param m: Mass vector
    :return: Chemical potential vector
    """
    return np.sqrt(k**2. + m**2.)

"""
Energy
"""


def eos_energy(rho, B_QCD, g_mg_ratio, p_quarks_momenta, p_electron_momentum):
    """
    Energy density.
    :param rho: Baryonic density
    :param B_QCD: Bag constant
    :param g_mg_ratio: g / m_G
    :param p_quarks_momenta: Quarks momenta
    :param p_electron_momentum: Electron momentum
    :return:
    """

    ret = (27. / 16.) * fator1 * g_mg_ratio ** 2. * rho ** 2. + B_QCD + \
        energy_quarks(p_quarks_momenta) + \
        energy_electrons(p_electron_momentum)

    return ret


def energy_quarks(p_quark_momenta):

    mu_quarks = mu(p_quark_momenta, eos_quark_masses)

    ret = fator_quarks * 3. * gamma_Q / (2. * math.pi ** 2.) * fator2 * \
        np.sum(
            p_quark_momenta ** 3. * mu_quarks / 4. +
            eos_quark_masses ** 2. * p_quark_momenta * mu_quarks / 8. -
            eos_quark_masses ** 4. / 8. * np.log(p_quark_momenta + mu_quarks) +
            (eos_quark_masses ** 4. / 16.) * np.log(eos_quark_masses ** 2.))

    return ret


def energy_electrons(electron_momentum):

    mu_electron = mu(electron_momentum, electron_mass)

    ret = gamma_E / (2. * math.pi ** 2.) * fator2 *\
        (
            electron_momentum ** 3. * mu_electron / 4. +
            electron_mass ** 2. * electron_momentum * mu_electron / 8. -
            (electron_mass ** 4. / 8.) * np.log(electron_momentum + mu_electron) +
            (electron_mass ** 4. / 16.) * np.log(electron_mass ** 2.))

    return ret


"""
Pressure
"""


def eos_pressure(rho, B_QCD, g_mg_ratio, p_quarks_momenta, p_electron_momentum):
    """
    Pressure.
    :param rho: Baryonic density
    :param B_QCD: Bag constant
    :param g_mg_ratio: g / m_G
    :param p_quarks_momenta: Quarks momenta
    :param p_electron_momentum: Electron momentum
    :return:
    """

    pressure = (27./16.) * fator1 * g_mg_ratio**2. * rho ** 2. - B_QCD + \
        pressure_quarks(p_quarks_momenta) + pressure_electron(p_electron_momentum)
                     
    return pressure
    
    
def pressure_quarks(p_quark_momenta):

    mu_quarks = mu(p_quark_momenta, eos_quark_masses)
    
    ret = fator_quarks * gamma_Q / (2. * math.pi ** 2.) * fator2 * \
        np.sum(
        p_quark_momenta ** 3. * mu_quarks / 4. -
        3.*eos_quark_masses ** 2. * p_quark_momenta * mu_quarks / 8. +
        3.*eos_quark_masses ** 4. * np.log(p_quark_momenta + mu_quarks)/8. -
        3.*eos_quark_masses ** 4. * np.log(eos_quark_masses ** 2.)/16.)

    return ret


def pressure_electron(p_electron_momentum):

    mu_electron = mu(p_electron_momentum, electron_mass)

    ret = gamma_E / (2. * math.pi ** 2.) * fator2 * \
        (
            p_electron_momentum ** 3. * mu_electron / 4. -
            3.*electron_mass ** 2. * p_electron_momentum * mu_electron / 8. +
            3.*electron_mass ** 4. * np.log(p_electron_momentum + mu_electron) / 8. -
            3.*electron_mass ** 4. * np.log(electron_mass ** 2.) / 16.)

    return ret


def quarks_momenta(p, parameters):
    """
    Returns the four equations of the system that must be satisfied by the EoS.

    The original equations from Mathematica:
        NSolve[{ku^3 + kd^3 + ks^3 ==  3*Pi*Pi* rho,
        2*ku^3 ==  kd^3 + ks^3 + ke^3,
        kd^2 + md^2 == ks^2 + ms^2,
        (ku^2 + mu^2)^(1/2)  + (ke^2 + me^2)^(1/2) == (ks^2 + ms^2)^(1/2)}]

    :param p: quarks + electron momenta
    :param parameters: density and masses
    :return: equations
    """

    # Variables
    k_u, k_d, k_s, k_e = p

    # Parameters
    rho_B, m_u, m_d, m_s, m_e = parameters

    equations = (
        k_u**3. + k_d**3. + k_s**3. - 3.*math.pi**2. * rho_B,
        2.*k_u**3. - k_d**3. - k_s**3. - k_e**3.,
        k_d**2. + m_d**2. - k_s**2. - m_s**2.,
        math.sqrt(k_u**2. + m_u**2.) + math.sqrt(k_e**2. + m_e**2.) - math.sqrt(k_s**2. + m_s**2.),
    )

    return equations


def quarks_momenta_nopar(p):
    """
    Returns the four equations of the system that must be satisfied by the EoS.
    :param p: quarks + electron momenta
    :param parameters: density and masses
    :return: equations
    """

    # Variables
    k_u, k_d, k_s, k_e = p

    # Parameters
    rho = rho_global
    m_u = eos_quark_masses[0]
    m_d = eos_quark_masses[1]
    m_s = eos_quark_masses[2]
    m_e = electron_mass

    return (
        k_u**3. + k_d**3. + k_s**3. - 3.*math.pi**2. * rho,
        2.*k_u**3. - k_d**3. - k_s**3. - k_e**3.,
        k_d**2. + m_d**2. - k_s**2. - m_s**2.,
        math.sqrt(k_u**2. + m_u**2.) + math.sqrt(k_e**2. + m_e**2.) - math.sqrt(k_s**2. + m_s**2.)
    )
