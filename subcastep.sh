#!/bin/bash

#bashjob submitter for castepsub in HPC clusters

cores="100"
time="24:00"

echo "Written by http://github.com/dphilphil"

#load castep on cluster
module load castep/17.2.1

for folder in */; do 

	cd $folder
	echo "$folder"

	#find *.cell file in folder 
		for fil in *.cell; do 
			#remove extension
			fname="${fil%.*}"
		done
	#submit job to cluster 
		castepsub -n $cores -W $time $fname
done
