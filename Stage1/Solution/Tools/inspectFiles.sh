#!/bin/bash

#Create an HexdumpFiles in Evidences/ directory
mkdir ../Evidences/HexdumpFiles

#Create an StringsFiles in Evidences/ directory
mkdir ../Evidences/StringsFiles

# Script to inspect files
# Inspect each file with the hexdump and strings tools, 
# placing each plain text output in 
# the Evidences/HexdumpFiles/ and Evidences/StringFiles/ folders.

# Inspect files using hexdump tool
hexdump -C ../daft_punk.gif > ../Evidences/HexdumpFiles/daft_punk_hexdump.txt
hexdump -C ../discovery.jpg > ../Evidences/HexdumpFiles/discovery_hexdump.txt
hexdump -C ../hbfs.wav > ../Evidences/HexdumpFiles/hbfs_hexdump.txt
hexdump -C ../homework.jpg > ../Evidences/HexdumpFiles/homework_hexdump.txt
hexdump -C ../ram.jpg > ../Evidences/HexdumpFiles/ram_hexdump.txt
hexdump -C ../SNA_Football_Lyrics.mp4 > ../Evidences/HexdumpFiles/SNA_Football_Lyrics.txt
hexdump -C ../ticket.jpg > ../Evidences/HexdumpFiles/ticket_hexdump.txt
hexdump -C ../chants.zip > ../Evidences/HexdumpFiles/chants_hexdump.txt

# Inspect files using strings tool
strings ../daft_punk.gif > ../Evidences/StringsFiles/daft_punk_strings.txt
strings ../discovery.jpg > ../Evidences/StringsFiles/discovery_strings.txt
strings ../hbfs.wav > ../Evidences/StringsFiles/hbfs_strings.txt
strings ../homework.jpg > ../Evidences/StringsFiles/homework_strings.txt
strings ../ram.jpg > ../Evidences/StringsFiles/ram_strings.txt
strings ../SNA_Football_Lyrics.mp4 > ../Evidences/StringsFiles/SNA_Football_Lyrics.txt
strings ../ticket.jpg > ../Evidences/StringsFiles/ticket_strings.txt
strings ../chants.zip > ../Evidences/StringsFiles/chants_strings.txt