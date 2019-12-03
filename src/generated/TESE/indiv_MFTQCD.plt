#!/usr/bin/gnuplot

reset

set macro

# Settings for all plots
set datafile separator ","

set encoding iso
set term post eps enhanced color font "Helvetica,15"
set lmargin 10
set grid
set grid ytics lc rgb "#C0C0C0"


#---------------------------------------------------------------------------------------------------
set style data lines

set style line 10 linecolor rgb "red"    lt 1 lw 5 pt 3 ps 0.5
set style line 11 linecolor rgb "red"    lt 2 lw 5 pt 3 ps 0.5
set style line 12 linecolor rgb "red"    lt 3 lw 5 pt 3 ps 0.5
set style line 13 linecolor rgb "red"    lt 4 lw 5 pt 3 ps 0.5
set style line 14 linecolor rgb "red"    lt 5 lw 5 pt 3 ps 0.5

set style line 21 linecolor rgb "orange" lt 1 lw 5 pt 3 ps 0.5
set style line 22 linecolor rgb "orange" lt 2 lw 3 pt 3 ps 0.5
set style line 23 linecolor rgb "orange" lt 3 lw 3 pt 3 ps 0.5
set style line 24 linecolor rgb "orange" lt 4 lw 3 pt 3 ps 0.5
set style line 25 linecolor rgb "orange" lt 5 lw 3 pt 3 ps 0.5
set style line 26 linecolor rgb "orange" lt 6 lw 3 pt 3 ps 0.5
set style line 27 linecolor rgb "orange" lt 7 lw 3 pt 3 ps 0.5
set style line 28 linecolor rgb "orange" lt 8 lw 3 pt 3 ps 0.5
set style line 29 linecolor rgb "orange" lt 9 lw 3 pt 3 ps 0.5


set style line 3 linecolor rgb "green"  lt 3 lw 5 pt 3 ps 0.5
set style line 4 linecolor rgb "blue"   lt 4 lw 5 pt 3 ps 0.5
set style line 5 linecolor rgb "violet" lt 5 lw 5 pt 3 ps 0.5

#set output "./MFTQCD.eps"

#---------------------------------------------------------------------------------------------------
#PLOT 1 - TODAS EOS - epsilon x pressure
#---------------------------------------------------------------------------------------------------


set output "./MFTQCD_90_epsilon_pressure.eps"

# set key left box linestyle -1
unset key
set xrange[0:2000]
set yrange[0:800]

set title 'MFTQCD B_{QCD}=90 MeV/fm^{3}, {/Symbol e} {/Symbol \264} P' font ",20"
unset title 

set xlabel '{/Symbol e} [MeV fm^{-3}]' font ",20"
set ylabel 'Pressure [MeV fm^{-3}]' font ",20"
set tics font ", 17"


columns="1:2"
#l_style="ls 1"
l_style=""
#plot "mftqcd_90_0_00040.csv" using @columns ls 10 title "{/Symbol x}=0.00040", \
#"mftqcd_90_0_00050.csv" using @columns ls 11 title "{/Symbol x}=0.00050", \
#     "mftqcd_90_0_00070.csv" using @columns ls 12 title "{/Symbol x}=0.00070", \
#     "mftqcd_90_0_00090.csv" using @columns ls 13 title "{/Symbol x}=0.00090", \
#     "mftqcd_90_0_00100.csv" using @columns ls 14 title "{/Symbol x}=0.00100", \
#     "mftqcd_90_0_0015.csv" using @columns ls 21 title "{/Symbol x}=0.000150", \
#     "mftqcd_90_0_0030.csv" using @columns ls 22 title "{/Symbol x}=0.000300", \
#     "mftqcd_90_0_0045.csv" using @columns ls 23 title "{/Symbol x}=0.000450", \
#     "mftqcd_90_0_0050.csv" using @columns ls 24 title "{/Symbol x}=0.000500", \
#     "mftqcd_90_0_0060.csv" using @columns ls 25 title "{/Symbol x}=0.000600", \
#     "mftqcd_90_0_0070.csv" using @columns ls 26 title "{/Symbol x}=0.000700", \
#     "mftqcd_90_0_0075.csv" using @columns ls 27 title "{/Symbol x}=0.000750", \
#     "mftqcd_90_0_0090.csv" using @columns ls 28 title "{/Symbol x}=0.000900", \

plot    "mftqcd_90_0_0015.csv" using @columns ls 10 title "{/Symbol x}=0.00015", \
        "mftqcd_90_0_0030.csv" using @columns ls 21 title "{/Symbol x}=0.00030", \
        "mftqcd_90_0_0045.csv" using @columns ls 3 title "{/Symbol x}=0.00045", \
        "mftqcd_90_0_0060.csv" using @columns ls 4 title "{/Symbol x}=0.00060", \
        "mftqcd_90_0_0075.csv" using @columns ls 5 title "{/Symbol x}=0.00075", \


#---------------------------------------------------------------------------------------------------
#PLOT 2 - TODAS EOS - pressure x epsilon
#---------------------------------------------------------------------------------------------------


set output "./MFTQCD_90_pressure_epsilon.eps"

# set key right bottom box linestyle -1

set yrange[0:2000]
set xrange[0:800]

set title 'MFTQCD B=90 MeV/fm^{3}, P {/Symbol \264} {/Symbol e}' font ",14"
set xlabel 'Pressure [MeV fm^{-3}]' font ",14"
set ylabel '{/Symbol e} [MeV fm^{-3}]' font ",14"

#set arrow from 120,0 to 120,500 nohead

columns="2:1"

plot "mftqcd_90_0_00040.csv" using @columns ls 10 title "{/Symbol x}=0.00040", \
     "mftqcd_90_0_00050.csv" using @columns ls 11 title "{/Symbol x}=0.00050", \
     "mftqcd_90_0_00070.csv" using @columns ls 12 title "{/Symbol x}=0.00070", \
     "mftqcd_90_0_00090.csv" using @columns ls 13 title "{/Symbol x}=0.00090", \
     "mftqcd_90_0_00100.csv" using @columns ls 14 title "{/Symbol x}=0.00100", \
     "mftqcd_90_0_0015.csv" using @columns ls 21 title "{/Symbol x}=0.000150", \
     "mftqcd_90_0_0030.csv" using @columns ls 22 title "{/Symbol x}=0.000300", \
     "mftqcd_90_0_0045.csv" using @columns ls 23 title "{/Symbol x}=0.000450", \
     "mftqcd_90_0_0050.csv" using @columns ls 24 title "{/Symbol x}=0.000500", \
     "mftqcd_90_0_0060.csv" using @columns ls 25 title "{/Symbol x}=0.000600", \
     "mftqcd_90_0_0070.csv" using @columns ls 26 title "{/Symbol x}=0.000700", \
     "mftqcd_90_0_0075.csv" using @columns ls 27 title "{/Symbol x}=0.000750", \
     "mftqcd_90_0_0090.csv" using @columns ls 28 title "{/Symbol x}=0.000900", \


#---------------------------------------------------------------------------------------------------
#PLOT 3 - TODAS EOS - mu x pressure
#---------------------------------------------------------------------------------------------------

set output "./MFTQCD_90_mu_pressure.eps"

# set key top left box linestyle -1

unset xrange
unset yrange

set xrange[900:4000]
set yrange[0:800]
#set ytics 100
#set xtics 250
set grid

set xlabel '{/Symbol m} [MeV]' font ",14"
set ylabel 'Pressure [MeV fm^{-3}]' font ",14"

set title 'MFTQCD B=90 MeV/fm^{3}, {/Symbol m} {/Symbol \264} P' font ",14"

#set label 1 at   500, 1000 '{/Symbol x}=0.0015' font "cmr10,15"
#set label 2 at  1500, 2000 '{/Symbol x}=0.0030' font "cmr10,15"
#set label 3 at  2500, 3600 '{/Symbol x}=0.0045' font "cmr10,15"
#set label 4 at  3000, 3300 '{/Symbol x}=0.0060' font "cmr10,15"
#set label 5 at  3000, 2150 '{/Symbol x}=0.0075' font "cmr10,15"
# set arrow from 3000,2000 to 2950,2150 nohead


columns="4:2"

plot "mftqcd_90_0_00040.csv" using @columns ls 10 title "{/Symbol x}=0.00040", \
     "mftqcd_90_0_00050.csv" using @columns ls 11 title "{/Symbol x}=0.00050", \
     "mftqcd_90_0_00070.csv" using @columns ls 12 title "{/Symbol x}=0.00070", \
     "mftqcd_90_0_00090.csv" using @columns ls 13 title "{/Symbol x}=0.00090", \
     "mftqcd_90_0_00100.csv" using @columns ls 14 title "{/Symbol x}=0.00100", \
     "mftqcd_90_0_0015.csv" using @columns ls 21 title "{/Symbol x}=0.000150", \
     "mftqcd_90_0_0030.csv" using @columns ls 22 title "{/Symbol x}=0.000300", \
     "mftqcd_90_0_0045.csv" using @columns ls 23 title "{/Symbol x}=0.000450", \
     "mftqcd_90_0_0050.csv" using @columns ls 24 title "{/Symbol x}=0.000500", \
     "mftqcd_90_0_0060.csv" using @columns ls 25 title "{/Symbol x}=0.000600", \
     "mftqcd_90_0_0070.csv" using @columns ls 26 title "{/Symbol x}=0.000700", \
     "mftqcd_90_0_0075.csv" using @columns ls 27 title "{/Symbol x}=0.000750", \
     "mftqcd_90_0_0090.csv" using @columns ls 28 title "{/Symbol x}=0.000900", \

#---------------------------------------------------------------------------------------------------
#PLOT 4 - TODAS EOS - n x epsilon
#---------------------------------------------------------------------------------------------------

set xrange[0:2000]
set yrange[0:2]

set output "./MFTQCD_90_rho_mu.eps"

# set key left center box linestyle -1

set title 'MFTQCD B=90 MeV/fm^{3}, {/Symbol m} {/Symbol \264} n' font ",14"

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
     "mftqcd_90_0_00040.csv" using @columns ls 10 title "{/Symbol x}=0.00040", \
     "mftqcd_90_0_00050.csv" using @columns ls 11 title "{/Symbol x}=0.00050", \
     "mftqcd_90_0_00070.csv" using @columns ls 12 title "{/Symbol x}=0.00070", \
     "mftqcd_90_0_00090.csv" using @columns ls 13 title "{/Symbol x}=0.00090", \
     "mftqcd_90_0_00100.csv" using @columns ls 14 title "{/Symbol x}=0.00100", \
     "mftqcd_90_0_0015.csv" using @columns ls 21 title "{/Symbol x}=0.000150", \
     "mftqcd_90_0_0030.csv" using @columns ls 22 title "{/Symbol x}=0.000300", \
     "mftqcd_90_0_0045.csv" using @columns ls 23 title "{/Symbol x}=0.000450", \
     "mftqcd_90_0_0050.csv" using @columns ls 24 title "{/Symbol x}=0.000500", \
     "mftqcd_90_0_0060.csv" using @columns ls 25 title "{/Symbol x}=0.000600", \
     "mftqcd_90_0_0070.csv" using @columns ls 26 title "{/Symbol x}=0.000700", \
     "mftqcd_90_0_0075.csv" using @columns ls 27 title "{/Symbol x}=0.000750", \
     "mftqcd_90_0_0090.csv" using @columns ls 28 title "{/Symbol x}=0.000900"
