reset

set xlabel 'epsilon' font "Helvetica,20"

set ylabel 'Pressure' font "Helvetica,20"

set xrange[0:8000]
#set yrange[1e-5:3]

#set xrange[0:30]

#set log x
#set log y

set datafile separator "\t"


set encoding iso
set terminal post eps enhanced mono
set output outputname

set style fill pattern 7


set title 'MFT-QCD'

plot datafile using 6:7 title plot_title
