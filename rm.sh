#!bin/bash 


for folder in */; do 
   cd $folder 
   if test -e joe.param || Tl2NiMnO6.param; then 
    rm *param 
   fi 
   cd ../
done
