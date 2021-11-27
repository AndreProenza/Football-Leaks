#!/bin/bash

#Create an lsb directory
mkdir lsb_chant1

#loop through lsb and passwords
for i in {1..16} #LSB
do
    for j in {0..12} #Password
    do
        python3 recoverWav.py recover ../Evidences/chant1.wav $i $j
        echo "recovered lsb${i}-${j}.txt"
        foremost -i lsb${i}-${j}.txt -o lsb_chant1/lsb${i}-${j}
        ls lsb_chant1/lsb${i}-${j}/*
        rm lsb${i}-${j}.txt
    done
done