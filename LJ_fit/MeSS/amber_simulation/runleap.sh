#!/bin/bash

source ~/Programs/amber18/amber.sh
res="MSS"

# source leaprc.ff14SB for amber < 16. 
# If not, source leaprc.protein.ff14SB

echo "source leaprc.protein.ff14SB
      source leaprc.water.tip3p
      loadAmberParams $res.prm
      loadAmberPrep   $res.in
      mol = sequence { $res }
      charge mol
      solvateOct mol TIP3PBOX 5.3
      saveAmberParm mol $res.prmtop $res.rst7
      savepdb mol ${res}.pdb
      quit" > lista-tleap

tleap -f lista-tleap
rm lista-tleap

