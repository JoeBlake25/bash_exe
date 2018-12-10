#!bin/bash

echo "Starting to run removing .check files"


for folder in */; 
   do cd $folder
      if test -e *check; then 
         echo "Found chekpoint file in $folder , removing"
         rm -f  *check
      fi
      cd ../
   done 
