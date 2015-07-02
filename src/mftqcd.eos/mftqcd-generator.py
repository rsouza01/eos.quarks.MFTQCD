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
    '''
    Shows the program usage
    :return:
    '''
    print (
        "Usage: \n" +
        "    mftqcd-generator.py -f=<gen|u|l>\n")


def get_cl_parameters(argv):
    '''
    Extracts the command line parameters.
    :param argv:
    :return:
    '''

    program_function = 0

    try:
        opts, args = getopt.getopt(argv, "hf:", ["help", "function="])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)

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

        elif opt == '-h':
            usage()
            exit(0)
        else:
            assert False, "Unhandled exception."

    return program_function

def main(argv):

    initTime = datetime.now()

    program_function = get_cl_parameters(argv)

    eos.fFuncMain(program_function)

    endTime = datetime.now()
    print "\n\n\n================================================"
    print "Time elapsed: %d ms." % ((endTime - initTime).microseconds)
    print "Done!"
    print "================================================"



if __name__ == "__main__":
    main(sys.argv[1:])
