#!/usr/bin/gnuplot


reset

set macro

# Settings for all plots
set datafile separator ","

set encoding iso
set term post eps enhanced font "Helvetica,10"
set lmargin 10
set grid
set grid ytics lc rgb "#C0C0C0"


#---------------------------------------------------------------------------------------------------
set style data lines

set style line 1 linecolor rgb "red"      lt 1 lw 1 pt 3 ps 0.5
set style line 2 linecolor rgb "orange"   lt 2 lw 1 pt 3 ps 0.5
set style line 3 linecolor rgb "green"    lt 3 lw 1 pt 3 ps 0.5
set style line 4 linecolor rgb "blue"     lt 4 lw 1 pt 3 ps 0.5
set style line 5 linecolor rgb "violet"   lt 5 lw 1 pt 3 ps 0.5

#set output "./MFTQCD.eps"

#---------------------------------------------------------------------------------------------------
#PLOT 1 - TODAS EOS - epsilon x pressure
#---------------------------------------------------------------------------------------------------


set output "./MFTQCD_epsilon_pressure.eps"

set key left box linestyle -1

set xrange[0:2000]
set yrange[0:800]

set title 'MFTQCD, {/Symbol e} {/Symbol \264} P' font ",14"
set xlabel '{/Symbol e} [MeV fm^{-3}]' font ",14"
set ylabel 'Pressure [MeV fm^{-3}]' font ",14"

columns="1:2"

plot "mftqcd_60_0_0060.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00060", \
     "mftqcd_60_0_0075.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00075", \
     "mftqcd_70_0_0045.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00045", \
     "mftqcd_70_0_0060.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00060", \
     "mftqcd_70_0_0075.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00075", \
     "mftqcd_80_0_0015.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00015", \
     "mftqcd_80_0_0030.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00030", \
     "mftqcd_80_0_0045.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00045", \
     "mftqcd_80_0_0060.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00060", \
     "mftqcd_80_0_0075.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00075", \
     "mftqcd_90_0_0015.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00015", \
     "mftqcd_90_0_0030.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00030", \
     "mftqcd_90_0_0045.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00045", \
     "mftqcd_90_0_0060.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00060", \
     "mftqcd_90_0_0075.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00075", \
     "mftqcd_100_0_0015.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00015", \
     "mftqcd_100_0_0030.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00030", \
     "mftqcd_100_0_0045.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00045", \
     "mftqcd_100_0_0060.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00060", \
     "mftqcd_100_0_0075.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00075"




#---------------------------------------------------------------------------------------------------
#PLOT 2 - TODAS EOS - pressure x epsilon
#---------------------------------------------------------------------------------------------------


set output "./MFTQCD_pressure_epsilon.eps"

set key right bottom box linestyle -1

set yrange[0:2000]
set xrange[0:800]

set title 'MFTQCD, P {/Symbol \264} {/Symbol e}' font ",14"
set xlabel 'Pressure [MeV fm^{-3}]' font ",14"
set ylabel '{/Symbol e} [MeV fm^{-3}]' font ",14"

#set arrow from 120,0 to 120,500 nohead

columns="2:1"

plot "mftqcd_60_0_0060.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00060", \
     "mftqcd_60_0_0075.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00075", \
     "mftqcd_70_0_0045.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00045", \
     "mftqcd_70_0_0060.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00060", \
     "mftqcd_70_0_0075.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00075", \
     "mftqcd_80_0_0015.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00015", \
     "mftqcd_80_0_0030.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00030", \
     "mftqcd_80_0_0045.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00045", \
     "mftqcd_80_0_0060.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00060", \
     "mftqcd_80_0_0075.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00075", \
     "mftqcd_90_0_0015.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00015", \
     "mftqcd_90_0_0030.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00030", \
     "mftqcd_90_0_0045.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00045", \
     "mftqcd_90_0_0060.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00060", \
     "mftqcd_90_0_0075.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00075", \
     "mftqcd_100_0_0015.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00015", \
     "mftqcd_100_0_0030.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00030", \
     "mftqcd_100_0_0045.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00045", \
     "mftqcd_100_0_0060.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00060", \
     "mftqcd_100_0_0075.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00075"


#---------------------------------------------------------------------------------------------------
#PLOT 3 - TODAS EOS - mu x pressure
#---------------------------------------------------------------------------------------------------

set output "./MFTQCD_mu_pressure.eps"

set key top left box linestyle -1

unset xrange
unset yrange

set xrange[900:4000]
set yrange[0:800]
#set ytics 100
#set xtics 250
set grid

set xlabel '{/Symbol m} [MeV]' font ",14"
set ylabel 'Pressure [MeV fm^{-3}]' font ",14"

set title 'MFTQCD, {/Symbol m} {/Symbol \264} P' font ",14"

#set label 1 at   500, 1000 '{/Symbol x}=0.0015' font "cmr10,15"
#set label 2 at  1500, 2000 '{/Symbol x}=0.0030' font "cmr10,15"
#set label 3 at  2500, 3600 '{/Symbol x}=0.0045' font "cmr10,15"
#set label 4 at  3000, 3300 '{/Symbol x}=0.0060' font "cmr10,15"
#set label 5 at  3000, 2150 '{/Symbol x}=0.0075' font "cmr10,15"
# set arrow from 3000,2000 to 2950,2150 nohead


columns="4:2"

plot "mftqcd_60_0_0060.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00060", \
     "mftqcd_60_0_0075.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00075", \
     "mftqcd_70_0_0045.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00045", \
     "mftqcd_70_0_0060.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00060", \
     "mftqcd_70_0_0075.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00075", \
     "mftqcd_80_0_0015.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00015", \
     "mftqcd_80_0_0030.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00030", \
     "mftqcd_80_0_0045.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00045", \
     "mftqcd_80_0_0060.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00060", \
     "mftqcd_80_0_0075.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00075", \
     "mftqcd_90_0_0015.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00015", \
     "mftqcd_90_0_0030.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00030", \
     "mftqcd_90_0_0045.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00045", \
     "mftqcd_90_0_0060.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00060", \
     "mftqcd_90_0_0075.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00075", \
     "mftqcd_100_0_0015.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00015", \
     "mftqcd_100_0_0030.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00030", \
     "mftqcd_100_0_0045.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00045", \
     "mftqcd_100_0_0060.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00060", \
     "mftqcd_100_0_0075.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00075"

#---------------------------------------------------------------------------------------------------
#PLOT 4 - TODAS EOS - n x epsilon
#---------------------------------------------------------------------------------------------------

set xrange[0:2000]
set yrange[0:2]

set output "./MFTQCD_rho_mu.eps"

set key left center box linestyle -1

set title 'MFTQCD, {/Symbol m} {/Symbol \264} n' font ",14"

set ylabel 'n [fm^{-3}]' font ",14"
set xlabel '{/Symbol m} [MeV]' font ",14"

set xtics 250
#set ytics 300

set ytics add ("{/Symbol r}_0" 0.16)
set ytics add ("3{/Symbol r}_0" 0.48)
set ytics add ("10{/Symbol r}_0" 1.6)

columns="4:3"

plot 0.16 with lines lt rgb "#660000" title "n_0", \
     0.48 with lines lt rgb "#660000" title "3 n_0", \
     1.6 with lines lt rgb "#660000" title "10 n_0", \
     "mftqcd_60_0_0060.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00060", \
     "mftqcd_60_0_0075.csv" using @columns ls 1 title "B=60 MeV, {/Symbol x}=0.00075", \
     "mftqcd_70_0_0045.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00045", \
     "mftqcd_70_0_0060.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00060", \
     "mftqcd_70_0_0075.csv" using @columns ls 2 title "B=70 MeV, {/Symbol x}=0.00075", \
     "mftqcd_80_0_0015.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00015", \
     "mftqcd_80_0_0030.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00030", \
     "mftqcd_80_0_0045.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00045", \
     "mftqcd_80_0_0060.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00060", \
     "mftqcd_80_0_0075.csv" using @columns ls 3 title "B=80 MeV, {/Symbol x}=0.00075", \
     "mftqcd_90_0_0015.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00015", \
     "mftqcd_90_0_0030.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00030", \
     "mftqcd_90_0_0045.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00045", \
     "mftqcd_90_0_0060.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00060", \
     "mftqcd_90_0_0075.csv" using @columns ls 4 title "B=90 MeV, {/Symbol x}=0.00075", \
     "mftqcd_100_0_0015.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00015", \
     "mftqcd_100_0_0030.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00030", \
     "mftqcd_100_0_0045.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00045", \
     "mftqcd_100_0_0060.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00060", \
     "mftqcd_100_0_0075.csv" using @columns ls 5 title "B=100 MeV, {/Symbol x}=0.00075"
