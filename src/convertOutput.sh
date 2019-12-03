#!/bin/bash


#CONVERTS EoS File from  NUC to CGS

#CONSTANTS:
#   MEV_TO_ERG   = 1.6021773e-6
#   FM_TO_CM     = 1e-13
#   FM3_TO_CM3   = 1e-39
#   LIGHT_SPEED_CGS = 2.998E+010
#   LIGHT_SPEED_CGS = 2,8988E+020
#   LIGHT_SPEED_FM = 2.998E+023
#   LIGHT_SPEED_FM_2 = 8.988E+046

_INPUT_DIR=./eos/

for _FILE_NAME in ${_INPUT_DIR}*.csv; do 

    full_filename=$(basename "$_FILE_NAME")
    extension="${full_filename##*.}"
    filename="${full_filename%.*}"
  

    # FILE CONTENTS:
    # epsilon, pressure, chem_potential
    awk '{printf"%.6e, %.6e, %.6e\n", $1,$2,$3' ${_FILE_NAME}  > ${filename}.NUC.csv


done
