#!/bin/bash

source ~/Programs/amber18/amber.sh
res="MES"

# source leaprc.ff14SB for amber < 16. 
# If not, source leaprc.protein.ff14SB

echo "source leaprc.protein.ff14SB
      source leaprc.water.tip3p
      loadamberparams MES.prm
      loadamberprep MES.in
      mes = loadpdb mes.pdb 
      charge mes
      solvatebox mes TIP3PBOX 10
      saveAmberParm mes $res_box.prmtop $res_box.rst7
      savepdb mes ${res}_box.pdb
      quit" > lista-tleap

tleap -f lista-tleap
rm lista-tleap

