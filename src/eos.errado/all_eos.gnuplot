reset

set xlabel 'epsilon' font "Helvetica,20"

set ylabel 'Pressure' font "Helvetica,20"

set xrange[0:25000]
set yrange[0:]

#set log x
#set log y

set datafile separator "\t"

set key left box linestyle -1

set encoding iso
set terminal post eps enhanced mono
set output "alleos.eps"

set style fill pattern 7


set title 'MFT-QCD'

plot "MFT.QCD.B_70_XI_0.003.FULL.csv" using 6:7 with lines title "B=70,XI=0.0030", \
    "MFT.QCD.B_70_XI_0.0045.FULL.csv" using 6:7 with lines  title "B=70,XI=0.0045", \
    "MFT.QCD.B_70_XI_0.0060.FULL.csv" using 6:7 with lines  title "B=70,XI=0.0060", \
    "MFT.QCD.B_70_XI_0.0075.FULL.csv" using 6:7 with lines title "B=70,XI=0.0075", \
    "MFT.QCD.B_80_XI_0.0015.FULL.csv" using 6:7 with lines title "B=80,XI=0.0015", \
    "MFT.QCD.B_80_XI_0.003.FULL.csv" using 6:7 with lines title "B=80,XI=0.0030"
