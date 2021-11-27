#!/bin/bash

#Create an lsb directory
mkdir lsb_hbfs

#loop through lsb and passwords
for i in {1..16} #LSB
do
    for j in {0..12} #Password
    do
        python3 recoverWav.py recover ../hbfs.wav $i $j
        echo "recovered lsb${i}-${j}.txt"
        foremost -i lsb${i}-${j}.txt -o lsb_hbfs/lsb${i}-${j}
        ls lsb_hbfs/lsb${i}-${j}/*
        lsb${i}-${j}.txt
    done
done