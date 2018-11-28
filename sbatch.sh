#!/bin/bash 

for folder in */; do 
   cd $folder 
      sbatch castepsub.sh 
done 

