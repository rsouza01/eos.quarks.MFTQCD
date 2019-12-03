reset

set xlabel '{/Symbol e} [MeV fm^{-3}]'

set ylabel 'P [MeV fm^{-3}]'

set xrange[0:4000]
set yrange[0:4000]

set datafile separator ","

set key at 150, 3900 left 
set key spacing 1.2 box opaque


set encoding utf8
set terminal post eps enhanced mono
set output "alleos.eps"

set style fill pattern 7

set title 'Equação de Estado MFT-CDQ'
p(x) = x

plot p(x) title "P={/Symbol e} (Limite da causalidade)" with filledcurve x2, \
    "MFT.QCD.B_70_XI_0.003.FULL.csv" using 6:7 with lines lw 2  lt rgb "blue" title "B=70 MeV fm^\{-3\}, {/Symbol x}=0.0030", \
    "MFT.QCD.B_70_XI_0.0045.FULL.csv" using 6:7 with lines lw 2  lt rgb "blue" title "B=70 MeV fm^\{-3\}, {/Symbol x}=0.0045", \
    "MFT.QCD.B_70_XI_0.006.FULL.csv"  using 6:7 with lines lw 2  lt rgb "blue" title "B=70 MeV fm^\{-3\}, {/Symbol x}=0.0060", \
    "MFT.QCD.B_70_XI_0.0075.FULL.csv" using 6:7 with lines lw 2  lt rgb "blue" title "B=70 MeV fm^\{-3\}, {/Symbol x}=0.0075", \
    "MFT.QCD.B_80_XI_0.0015.FULL.csv" using 6:7 with lines lw 2  lt rgb "red" title "B=80 MeV fm^\{-3\}, {/Symbol x}=0.0015", \
    "MFT.QCD.B_80_XI_0.003.FULL.csv" using 6:7 with lines lw 2  lt rgb "red" title "B=80 MeV fm^\{-3\}, {/Symbol x}=0.0030", \
    "MFT.QCD.B_80_XI_0.0045.FULL.csv" using 6:7 with lines lw 2  lt rgb "red" title "B=80 MeV fm^\{-3\}, {/Symbol x}=0.0045", \
    "MFT.QCD.B_80_XI_0.006.FULL.csv" using 6:7 with lines lw 2  lt rgb "red" title "B=80 MeV fm^\{-3\}, {/Symbol x}=0.0060", \
    "MFT.QCD.B_80_XI_0.0075.FULL.csv" using 6:7 with lines lw 2  lt rgb "red" title "B=80 MeV fm^\{-3\}, {/Symbol x}=0.0075", \
    "MFT.QCD.B_90_XI_0.0015.FULL.csv" using 6:7 with lines lw 2  lt rgb "purple" title "B=90 MeV fm^\{-3\}, {/Symbol x}=0.0015", \
    "MFT.QCD.B_90_XI_0.003.FULL.csv" using 6:7 with lines lw 2  lt rgb "purple" title "B=90 MeV fm^\{-3\}, {/Symbol x}=0.0030", \
    "MFT.QCD.B_90_XI_0.0045.FULL.csv" using 6:7 with lines lw 2  lt rgb "purple" title "B=90 MeV fm^\{-3\}, {/Symbol x}=0.0045", \
    "MFT.QCD.B_90_XI_0.006.FULL.csv" using 6:7 with lines lw 2  lt rgb "purple" title "B=90 MeV fm^\{-3\}, {/Symbol x}=0.0060", \
    "MFT.QCD.B_90_XI_0.0075.FULL.csv" using 6:7 with lines lw 2  lt rgb "purple" title "B=90 MeV fm^\{-3\}, {/Symbol x}=0.0075", \
    "MFT.QCD.B_100_XI_0.0015.FULL.csv" using 6:7 with lines lw 2  lt rgb "green" title "B=100 MeV fm^\{-3\}, {/Symbol x}=0.0015", \
    "MFT.QCD.B_100_XI_0.003.FULL.csv" using 6:7 with lines lw 2  lt rgb "green" title "B=100 MeV fm^\{-3\}, {/Symbol x}=0.0030", \
    "MFT.QCD.B_100_XI_0.0045.FULL.csv" using 6:7 with lines lw 2  lt rgb "green" title "B=100 MeV fm^\{-3\}, {/Symbol x}=0.0045", \
    "MFT.QCD.B_100_XI_0.006.FULL.csv" using 6:7 with lines lw 2  lt rgb "green" title "B=100 MeV fm^\{-3\}, {/Symbol x}=0.0060", \
    "MFT.QCD.B_100_XI_0.0075.FULL.csv" using 6:7 with lines lw 2  lt rgb "green" title "B=100 MeV fm^\{-3\}, {/Symbol x}=0.0075"


####################################################################################################

unset title

# Enable the use of macros
set macros

# MACROS

# x- and ytics for each row resp. column
NOXTICS = "unset xtics;unset xlabel"

XTICS = "set xtics 0,1,3; set xlabel '{/Symbol e} [10^3 MeV fm^{-3}]'"
XTICSFULL = "set xtics 0,1,4; set xlabel '{/Symbol e} [10^3 MeV fm^{-3}]'"

NOYTICS = "set format y ''; unset ylabel"
YTICSFULL = "set ytics 1,1,4; set ylabel 'P [10^3 MeV fm^{-3}]'"
#YTICS = "set format y '%.0f'; set ylabel 'P [10^3 MeV fm^{-3}]'"
YTICS = "set ytics 1,1,4; set ylabel 'P [10^3 MeV fm^{-3}]'"

# Margins for each row resp. column
TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.55"
BMARGIN = "set tmargin at screen 0.55; set bmargin at screen 0.20"
LMARGIN = "set lmargin at screen 0.15; set rmargin at screen 0.55"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"

# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.65,0.1 font '0,12'"

unset key
set key at 0.05,3.9 left 
set key spacing 1.2 box opaque


set output "all_eos_frame.eps"

### Start multiplot (2x2 layout)
set xrange[0:4]
set yrange[0:4]

set multiplot layout 2,2 rowsfirst title "Equação de Estado MFT QCD"

# --- GRAPH a
@TMARGIN; @LMARGIN;@NOXTICS; @YTICSFULL
set label 1 'B=70 MeV fm^{-3}' @POS

plot p(x) title "P={/Symbol e}" with filledcurve x2, \
    "MFT.QCD.B_70_XI_0.003.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "blue" title "{/Symbol x}=0.0030", \
    "MFT.QCD.B_70_XI_0.0045.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "blue" title "{/Symbol x}=0.0045", \
    "MFT.QCD.B_70_XI_0.006.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "blue" title "{/Symbol x}=0.0060", \
    "MFT.QCD.B_70_XI_0.0075.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "blue" title "{/Symbol x}=0.0075"


# --- GRAPH b
@TMARGIN; @RMARGIN; @NOXTICS; @NOYTICS
set label 1 'B=80 MeV fm^{-3}' @POS

plot p(x) title "P={/Symbol e}" with filledcurve x2, \
    "MFT.QCD.B_80_XI_0.0015.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "red" title "{/Symbol x}=0.0015", \
    "MFT.QCD.B_80_XI_0.003.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "red" title "{/Symbol x}=0.0030", \
    "MFT.QCD.B_80_XI_0.0045.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "red" title "{/Symbol x}=0.0045", \
    "MFT.QCD.B_80_XI_0.006.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "red" title "{/Symbol x}=0.0060", \
    "MFT.QCD.B_80_XI_0.0075.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "red" title "{/Symbol x}=0.0075"


# --- GRAPH c
@BMARGIN; @LMARGIN; @XTICS; @YTICS
set label 1 'B=90 MeV fm^{-3}' @POS

plot p(x) title "P={/Symbol e}" with filledcurve x2, \
    "MFT.QCD.B_90_XI_0.0015.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2 lt rgb "purple" title "{/Symbol x}=0.0015", \
    "MFT.QCD.B_90_XI_0.003.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "purple" title "{/Symbol x}=0.0030", \
    "MFT.QCD.B_90_XI_0.0045.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "purple" title "{/Symbol x}=0.0045", \
    "MFT.QCD.B_90_XI_0.006.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "purple" title "{/Symbol x}=0.0060", \
    "MFT.QCD.B_90_XI_0.0075.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "purple" title "{/Symbol x}=0.0075"


# --- GRAPH d
@BMARGIN; @RMARGIN; @XTICSFULL; @NOYTICS
set label 1 'B=100 MeV fm^{-3}' @POS

plot p(x) title "P={/Symbol e}" with filledcurve x2, \
    "MFT.QCD.B_100_XI_0.0015.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2 lt rgb "green" title "{/Symbol x}=0.0015", \
    "MFT.QCD.B_100_XI_0.003.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "green" title "{/Symbol x}=0.0030", \
    "MFT.QCD.B_100_XI_0.0045.FULL.csv" using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "green" title "{/Symbol x}=0.0045", \
    "MFT.QCD.B_100_XI_0.006.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "green" title "{/Symbol x}=0.0060", \
    "MFT.QCD.B_100_XI_0.0075.FULL.csv"  using ($6/1e3):($7/1e3) with lines lw 2  lt rgb "green" title "{/Symbol x}=0.0075"

unset multiplot
### End multiplot
