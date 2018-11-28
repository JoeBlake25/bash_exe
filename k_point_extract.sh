#!/bin/bash

echo "Written by https://github.com/dphilphil and Broken by Joseph Blake"

for folder in */; do
	cd $folder

	#search for warnings	
	#if grep 'warn' *castep
	#  then echo "Warning Found @ $folder" >> '../warnings.log'
	#  else echo "Warning NotFound @ $folder" >> '../warnings.log'
	#fi
	
	#-n prevents carriage return (new line)
	#-e allows escape characters to be read, used here to read \t as tab
	echo -ne "$folder \t" >> '../K-point_list.log'	
	#grep finds line then pipe to awk to match word
	grep "K-point" *bands | awk '{print $3}' >> '../K-point_list.log'
	
done
