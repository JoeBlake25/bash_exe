#!bin/bash


echo "Enter the seedname"
read seedname

echo "please enter either 'singlepoint' or 'fine_grid_scale' convergnce testing"
read testing 
echo -ne  $testing /t >> 'writing.temp'
 

echo "what task would you like CASTEP to run?"
read task


if (( grep -q 'singlepoint' writing.temp )); then 
   echo "what is the minimum and maximum energy youd like to start testing?"
   read min_energy max_energy

   for folder in */; do 
      cd $folder
      for ((i=min_energy; i<=max_energy; i+=50)); do
         echo "cut_off_energy = $i" >> "$seedname.param"
         cd ../
      done 
   done 



elif (( $testing == 2)); then 
   echo "What is the maximum fine_grid_scale you'd like to test?"
   read max_fine_grid_scale

   for folder in */; do 
      cd $folder
      for ((i=2; i<=max_fine_grid_scale; i+=0.25)); do
        echo "find_grid_scale = $i" >> "$seedname.param"
        cd ../
      done
   done
fi

for foler in */; do 
   cd $folder
   echo "task= $task" >> "$seedname.param"
done


