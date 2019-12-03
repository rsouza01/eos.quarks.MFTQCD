#!/bin/bash

clear

echo "=============================================================================================="
echo "Generating MFT QCD plots..."
echo "=============================================================================================="


for _FILE_NAME in *.csv; do 

    full_filename=$(basename "$_FILE_NAME")
    extension="${full_filename##*.}"
    filename="${full_filename%.*}"
    
    # echo $full_filename
    # echo $filename
    # echo $extension

    output=${filename}.eps
    data=${full_filename}
    
    aux=${filename:8}
    aux2=${aux/B_/B=}
    aux3=${aux2/.FULL/ }
    plot_title=${aux3/_XI_/ MeV fm^\{-3\}, \{/Symbol x\}=}

    echo "Generating ${output}..."

    gnuplot -e "datafile='${data}'; outputname='${output}'; plot_title='${plot_title}'" eos.gnuplot

    
done

echo "=============================================================================================="

echo "Generating all_eos.gnuplot..."

gnuplot all_eos.gnuplot

echo "=============================================================================================="
echo "Done!"
echo "=============================================================================================="
