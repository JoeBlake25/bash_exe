#!/bin/bash


####################################################################################
##										  ##
##		This Script extracts the convergence parameters of a              ##
##              CASTEP run and puts them into '.log' files, suitable              ##
##              to be used with a plotter. The script also tells the              ## 
##              user if the run has not completed.                                ##
##										  ##
##									          ##
####################################################################################
##               								  ##
##                        Written By Joseph Blake 20/11/2018                      ##
##										  ##
####################################################################################


echo "Starting to run code"
#clearing the work directory of previous runs, keeping the logs relevent
if test -e energy.log || test -e spin.log || test -e stress.log || test -e WARNING.log; then 
echo "Found previous *.log files, removing"
rm -f energy.log spin.log stress.log WARNING.log
fi  

for folder in */; do 
	cd $folder
#For each convergence parameter, checking if it is present and outputting.
       if grep -q "NB est. 0K energy (E-0.5TS)" *.castep; then 	
          echo "extracting from folder $folder" 
	  echo -ne "$folder \t" >> "../energy.log"
	  grep  "NB est. 0K energy (E-0.5TS)" *.castep | awk '{print $7}' >> '../energy.log'
       else 
          echo -ne "$folder \t" >> '../WARNING.log'
          echo  "WARNING! Could not find final energy, CASTEP not converged!" >> '../WARNING.log'
       fi
     
       if grep -q "Integrated Spin Density" *.castep; then 
          echo -ne "$folder \t" >> "../spin.log"
          grep "Integrated Spin Density" *castep | awk '{print $5}' >> '../spin.log';
          
       else
          echo -ne "$folder \t" >> '../WARNING.log' 
          echo "WARNING! Could not find Spin Density, CASTEP not converged!" >> '../WARNING.log'
       fi

       if grep -q "Pressure:" *.castep; then
          echo -ne "$folder \t" >> "../stress.log" 
          grep "Pressure:" *castep | awk '{print $4}' >> '../stress.log';
       else 
        echo -ne "$folder \t" >> '../WARNING.log'
        echo "WARNING! Could not find stress, either CASTEP has not converged or you have not turned it on.'calculate_stress = true'" >> '../WARNING.log'
       
       fi
       cd ../
	
   
done
#Telling the user that their run did not Converge!
if test -e WARNING.log; then 
echo "Extrating values failed for one or more folder, check WARNING.log file for more information"
fi
  
