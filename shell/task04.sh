#!/bin/bash 
echo 'file1 name'
read file1
echo 'file2 name'

name1=${echo "$file1" | cut -f 1 -d '.')
name2=${echo "$file2" | cut -f 1 -d '.')

declare -i file1num=$(grep -c "${name1}" $file1)
declare -i file2num=$(grep -c "${name2}" $file2)
declare filetoUse="$file1"

if [ ${file1num} -le ${file2num} ] then filetoUse="$file2"; fi

cut -d " " -f4- ${filetoUse} | sort > "$(echo ${filetoUse} | cut -f 1 -d '.')".songs
