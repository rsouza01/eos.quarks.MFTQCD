#!/bin/bash

clear

echo "=============================================================================================="
echo "Converting MFT QCD Tables..."
echo "=============================================================================================="


for _FILE_NAME in ../eos/*.csv; do 

    full_filename=$(basename "$_FILE_NAME")
    extension="${full_filename##*.}"
    filename="${full_filename%.*}"

    output=../eos.conv/${filename}.CGS.csv
    
    plot_title=${aux3/_XI_/;XI=}

    echo "Converting '${full_filename}' to '${output}'..."
    
    

    cat $_FILE_NAME | ./mftqcd-converter.py > ${output}

done

echo "=============================================================================================="
echo "Done!"
echo "=============================================================================================="
