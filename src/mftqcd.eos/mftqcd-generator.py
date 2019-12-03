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


from datetime import datetime

import sys
import getopt

import mftqcd as eos


def usage():
    """
    Shows the program usage
    """
    print(
        "Usage: \n" +
        "    mftqcd-generator.py -f=<gen|u|l>\n")


def get_cl_parameters(argv):
    """
    Extracts the command line parameters.
    :param argv:
    :return:
    """

    program_function = 0

    try:
        opts, args = getopt.getopt(argv, "hf:b:r:", ["help", "function=", "b_qcd=", "qcd_ratio="])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)

    b_qcd = 0
    ratio = 1

    for opt, arg in opts:

        if opt in ("-f", "--function"):
            # Generate the EoS
            if arg == "gen":
                program_function = 0
            # Upper window
            elif arg == "u":
                program_function = 1
            # Lower window
            elif arg == "l":
                program_function = 2

        elif opt in ("-b", "--b_qcd"):
            # Generate the EoS
            b_qcd = float(arg)

        elif opt in ("-r", "--qcd_ratio"):
            # Generate the EoS
            ratio = float(arg)

        elif opt == '-h':
            usage()
            exit(0)
        else:
            assert False, "Unhandled exception."

    return program_function, b_qcd, ratio


def main(argv):

    init_time = datetime.now()

    cl_parameters, b_qcd, ratio = get_cl_parameters(argv)

    eos.func_main(cl_parameters, b_qcd, ratio)

    end_time = datetime.now()

    print_footer = False

    if print_footer:
        print("\n\n\n" + "#" + "="*100)
        print("#"+"Time elapsed: %d ms." % (end_time - init_time).microseconds)
        print("#"+"Done!")
        print("#"+"="*100)


if __name__ == "__main__":
    main(sys.argv[1:])
