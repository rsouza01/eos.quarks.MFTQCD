#!/usr/bin/gnuplot

reset

set xlabel 'epsilon' font "Helvetica,20"

set ylabel 'Pressure' font "Helvetica,20"

set xrange[0:3000]
set yrange[0:]

#set log x
#set log y

set datafile separator ","

set key left box linestyle -1

set encoding iso
set terminal post eps enhanced mono
set output "alleos_.eps"

set style fill pattern 7


set title 'MFT-QCD'

plot "mftqcd_80_0_0015.csv" using 2:3 with lines lt rgb "blue" title "B=80,XI=0.0015", \
"mftqcd_80_0_0030.csv" using 2:3 with lines lt rgb "blue" title "B=80,XI=0.0030", \
"mftqcd_80_0_0045.csv" using 2:3 with lines lt rgb "blue" title "B=80,XI=0.0045", \
"mftqcd_80_0_0060.csv" using 2:3 with lines lt rgb "blue" title "B=80,XI=0.0060", \
"mftqcd_80_0_0075.csv" using 2:3 with lines lt rgb "blue" title "B=80,XI=0.0075", \
"mftqcd_70_0_0030.csv" using 2:3 with lines title "B=70,XI=0.0030"

#plot "mftqcd_70_0_0030.csv" using 2:3 with lines title "B=70,XI=0.0030", \
#    "mftqcd_80_0_0030.csv" using 2:3 with lines title "B=80,XI=0.0030", \
#    "mftqcd_90_0_0030.csv" using 2:3 with lines title "B=90,XI=0.0030", \
#    "mftqcd_100_0_0030.csv" using 2:3 with lines title "B=100,XI=0.0030"
