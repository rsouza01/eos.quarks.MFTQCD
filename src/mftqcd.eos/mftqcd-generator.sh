#!/bin/bash


#qcd_B=( 90)
#qcd_B=( 90 80 70 60)
#qcd_ratio=( 0.00300 0.00200 0.00150 0.00100 0.00090 0.00070 0.00050)
#qcd_ratio=( 0.00137)

qcd_B=(90)
qcd_ratio=( 0.00100 0.00090 0.00070 0.00050 0.00040)
OUT_DIR=../generated/TESE/

for mit_B in "${qcd_B[@]}"
do
    for ratio in "${qcd_ratio[@]}"
    do
        ratio_str=${ratio//./_}
        ./mftqcd-generator.py --function=gen --b_qcd=${mit_B} --qcd_ratio=${ratio} > ${OUT_DIR}/mftqcd_${mit_B}_${ratio_str}.csv

    done
done
