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
from enum import Enum

fm = 5.07e-3


class Nucleons(Enum):
    """
    Here come the nucleons.
    """
    proton = 0
    neutron = 1
    
nucleons_masses = np.array([938., 939.])


class Quarks(Enum):
    """
    Quarks are ordered here from lower to higher masses.
    """
    up = 0
    down = 1
    strange = 2
    charm = 3
    bottom = 4
    top = 5
    
"""
Quarks masses
Source: https://en.wikipedia.org/wiki/Quark :-(
"""
quark_masses = np.array([5., 7., 150., 1290., 4200., 173000.]) * fm


class Leptons(Enum):
    electron = 0
    muon = 1
    tau = 2
    electron_neutrino = 3
    muon_neutrino = 4
    tau_neutrino = 5
    
"""
Lepton masses.
Source: https://en.wikipedia.org/wiki/Lepton :-(
"""
lepton_masses = np.array([0.5, 106., 1777., 0., 0.17, 15.5]) * fm
