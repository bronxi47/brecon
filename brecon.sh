#!/usr/bin/env bash
cat <<!TITLE!
  _                              
 | |__  _ __ ___  ___ ___  _ __  
#| '_ \| '__/ _ \/ __/ _ \| '_ \ 
 | |_) | | |  __/ (_| (_) | | | |
 |_.__/|_|  \___|\___\___/|_| |_|
                                 
         by bronxi <(-_-)>
    https://github.com/bronxi47

 Brecon is a Bash script that chains
 together assetfinder, amass, gobuster,
 httpx, and Censys for both active and
 passive reconnaissance.
!TITLE!
# Agregar if para revisar si están instaladas las tools necesarias, sinó instalarlas.

TARGET=$1
DIR=$2

mkdir $DIR &&
cd $DIR &&
assetfinder $TARGET | tee -a $DIR.txt  &&
amass enum -passive -d $TARGET >> $DIR.txt &&
gobuster dns -d $TARGET -w ../all_sanit.txt -t 100 --no-color -o gobuster_"$DIR".txt &&
cat gobuster_"$DIR".txt | sed 's@.* @@' >> $DIR.txt && rm gobuster_"$DIR".txt &&
python3 ../censys-subdomain-finder/censys-subdomain-finder.py $TARGET | sed -e 's/[ -]//g' >> $DIR.txt &&
# Agregar permutaciones.
sort -u "$DIR".txt > "$DIR"_sanitized.txt &&
httpx -l "$DIR"_sanitized.txt -sc | tee -a all_subs_"$DIR".txt &&
cat all_subs_"$DIR".txt | grep 404 | cut -d " " -f 1 > 404_"$DIR".txt &&
cat all_subs_"$DIR".txt | grep 403 | cut -d " " -f 1 > 403_"$DIR".txt &&
cat all_subs_"$DIR".txt | grep -v 404 | cut -d " " -f 1 > 200_more_"$DIR".txt &&
echo "RECON Finished" &&
gowitness file -f 200_more_"$DIR".txt && gowitness report serve