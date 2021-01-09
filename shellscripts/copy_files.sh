
#!/bin/bash

# This script will take the last files from your specified downloads directory 
# and copy them into the repository directory

echo Your download directory is $HOME/Downloads

downdir="${HOME}/Downloads/"
echo $downdir

echo How many files do you want to copy?
read nofiles

echo "What is your econometrics2 repository directory (e.g. Documents/econometrics2 (Windows), /Documents/git/econometrics2 (Mac) )"
read destdir

if [ ${destdir:0:1} != "/" ]
then
destdir="${HOME}/${destdir}"
else
destdir="$HOME${destdir}"
fi

echo "#####"
echo "#####"
echo "#####"
echo These files will be copied:
ls -Art | tail -$nofiles
echo "#####"
echo "#####"
echo "#####"

for i in `ls -Art | tail -$nofiles`
do
from="${downdir}/${i}"
to="${destdir}"
cp -p "$from" "$to"
done
echo "Copying Completed"

