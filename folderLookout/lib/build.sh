#! /bin/bash
cpvar=$1
cpvar+=$2

result=$(find lib/fileHistory.txt -type f -print | xargs grep $2)
if [[ $result != *$2* ]]
then
   if cp $cpvar "results/." ; then
      echo "File ${2} copied"
      echo $2 >> "lib/fileHistory.txt"
   fi
else
   echo "File was already used"
fi
