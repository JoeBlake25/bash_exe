#!/bin/bash

#bash job for loading all my modules 


module load castep/17.2
echo "loaded CASTEP-17.2"
module load xmgrace/5.1.23
echo "loaded xmgrace-5.1.23"
module load intel/17.0.2
echo "loaded intel library- 17.0.2"
#cd /work/scratch/scarf531
#echo "accessing interactive shell over 10 nodes"
#bsub -n 10 -Is bash 

#sleep 5

#echo "Determine if you have the nodes to yourself!"
#top
