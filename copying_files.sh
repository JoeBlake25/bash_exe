#!bin/bash 

#echo "enter the directory you wish to cope to, you don't need to have made it"

#read directory

#if test -d $directory; then 
#exit 
#else 
#mkdir $directory 
#fi

#echo "enter the files you wish to copy"

#while read -a files; do 

#echo "$files"

#done
#for folder in */; do 

#   cd $folder;

while IFS= read -r -d $'\0' file; do
  echo "$file"
done < <(find . -print0)
