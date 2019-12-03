reset

set datafile separator ","

set encoding iso
set terminal postscript eps enhanced font "cmr10"
set output "alleos.eps"

set lmargin 6

set key left box linestyle -1

set grid

set xrange[0:2]
set yrange[0:]
set xlabel '{/Symbol r} [g cm^{-3}] {/Symbol \264} 10^{15}' font "cmr10,15"
set ylabel 'Pressure [erg cm^{-3}] {/Symbol \264} 10^{35}' font "cmr10,15"

set title '{/Symbol r} {/Symbol \264} P'

plot         "sly4.dat.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "blue" title "Sly4", \
    "qcd.ire.eos.UDS.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "red" title "QCD IRE", \
    "MFT.QCD.B_70_XI_0.0030.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "green" title "MFT QCD, B=70 MeV, {/Symbol x}=0.003", \
    "MFT.QCD.B_70_XI_0.0045.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "green" title "MFT QCD, B=70 MeV, {/Symbol x}=0.0045", \
    "MFT.QCD.B_70_XI_0.0060.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "green" title "MFT QCD, B=70 MeV, {/Symbol x}=0.0060", \
    "MFT.QCD.B_70_XI_0.0075.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "green" title "MFT QCD, B=70 MeV, {/Symbol x}=0.0075", \
    "MFT.QCD.B_80_XI_0.0015.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "green" title "MFT QCD, B=80 MeV, {/Symbol x}=0.0015", \
    "MFT.QCD.B_80_XI_0.0030.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "turquoise" title "MFT QCD, B=80 MeV, {/Symbol x}=0.0030", \
    "MFT.QCD.B_80_XI_0.0045.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "turquoise" title "MFT QCD, B=80 MeV, {/Symbol x}=0.0045", \
    "MFT.QCD.B_80_XI_0.0060.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "turquoise" title "MFT QCD, B=80 MeV, {/Symbol x}=0.0060", \
    "MFT.QCD.B_80_XI_0.0075.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "turquoise" title "MFT QCD, B=80 MeV, {/Symbol x}=0.0075", \
    "MFT.QCD.B_90_XI_0.0015.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "orange" title "MFT QCD, B=90 MeV, {/Symbol x}=0.0015", \
    "MFT.QCD.B_90_XI_0.0030.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "orange" title "MFT QCD, B=90 MeV, {/Symbol x}=0.0030", \
    "MFT.QCD.B_90_XI_0.0045.FULL.CGS.csv" using ($1/1e15):($2/1e35) with lines lt rgb "orange" title "MFT QCD, B=90 MeV, {/Symbol x}=0.0045"

