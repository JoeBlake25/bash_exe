#!bin/bash
##################################################################################
##           									##
##	        	This Script aims at copying files to a new directory.	##
##		        One can also change a parameter.			##
##	        	This is for convergence testing ease.			##
##										##
##################################################################################
##	        	Written By Joseph Blake 26/11/2018		 	##
##################################################################################
for folder in */; do
   cd $folder 
   #$folder = place_holder
   echo "copying files into $folder" 
   cp ../*param ../*cell ../casteprun.sh .
   
   #sed -e  's/fine_grid_scale : 2/ fine_grid_scale : $folder/g' > Tl2NiMnO6.param
   #echo "${Tl2NiMnO6.param// 2/place_holder }" > Tl2NiMnO6.param   
    
   cd ../
done
