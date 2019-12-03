#!/usr/bin/gnuplot

reset

set xlabel 'epsilon' font "Helvetica,20"

set ylabel 'Pressure' font "Helvetica,20"

set xrange[0:1000]
set yrange[0:500]

#set log x
#set log y

set datafile separator ","

set key left box linestyle -1

set encoding iso
set terminal post eps enhanced mono
set output "bruno_eos.eps"

set style fill pattern 7


set title 'MFT-QCD'

plot "mftqcd_38_0_007293.csv" using 2:3 with lines title "B=38,XI=0.007293", \
    "mftqcd_75_7_0_000657.csv" using 2:3 with lines title "B=75.7,XI=0.000657"
