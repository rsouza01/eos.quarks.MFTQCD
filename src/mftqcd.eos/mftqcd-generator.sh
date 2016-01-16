#!/bin/bash

# MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv

qcd_B=( 80 90 100)
qcd_ratio=( 0.0015 0.0030 0.0045 0.0060 0.0075)

for mit_B in "${qcd_B[@]}"
do
    for ratio in "${qcd_ratio[@]}"
    do
        ./mftqcd-generator.py --function=gen --b_qcd=${mit_B} --qcd_ratio=${ratio} > ../generated/mftqcd_${mit_B}_${ratio}.csv

    done
done
