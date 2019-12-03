reset

set xlabel '{/Symbol e} [MeV fm^{-3}]'

set ylabel 'P [MeV fm^{-3}]'

set xrange[0:]
set yrange[0:]

#set datafile separator "\t"
set datafile separator ","

set key at 250, 3250 left

set encoding utf8
set terminal post eps enhanced mono
set output outputname

set style fill pattern 7

set title 'Equação de Estado MFT-CDQ'

plot datafile using 6:7 with lines lt rgb "red" title plot_title
