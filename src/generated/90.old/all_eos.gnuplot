#!/usr/bin/gnuplot

reset

set xlabel 'epsilon' font "Helvetica,20"
set ylabel 'Pressure' font "Helvetica,20"

set xrange[0:5000]
set yrange[0:5000]

set datafile separator ","

set key left box linestyle -1

set encoding iso
set terminal post eps enhanced mono
set output "mftqcd_90.eps"

set style fill pattern 7

set title 'MFT-QCD'

plot "mftqcd_90_0_0005.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0005", \
    "mftqcd_90_0_0010.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0010", \
    "mftqcd_90_0_0015.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0015", \
    "mftqcd_90_0_0020.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0020", \
    "mftqcd_90_0_0025.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0025", \
    "mftqcd_90_0_0030.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0030", \
    "mftqcd_90_0_0035.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0035", \
    "mftqcd_90_0_0040.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0040", \
    "mftqcd_90_0_0045.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0045", \
    "mftqcd_90_0_0050.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0050", \
    "mftqcd_90_0_0055.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0055", \
    "mftqcd_90_0_0060.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0060", \
    "mftqcd_90_0_0065.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0065", \
    "mftqcd_90_0_0070.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0070", \
    "mftqcd_90_0_0075.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0075", \
    "mftqcd_90_0_0080.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0080", \
    "mftqcd_90_0_0085.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0085", \
    "mftqcd_90_0_0090.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0090", \
    "mftqcd_90_0_0095.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.0095", \
    "mftqcd_90_0_050.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.050", \
    "mftqcd_90_0_055.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.055", \
    "mftqcd_90_0_060.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.060", \
    "mftqcd_90_0_065.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.065", \
    "mftqcd_90_0_070.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.070", \
    "mftqcd_90_0_075.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.075", \
    "mftqcd_90_0_080.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.080", \
    "mftqcd_90_0_085.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.085", \
    "mftqcd_90_0_090.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.090", \
    "mftqcd_90_0_095.csv" using 1:2 with lines lt rgb "blue" title "B=90,XI=0.095", \
    
