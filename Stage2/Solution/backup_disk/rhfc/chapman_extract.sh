#!/bin/bash

python3 extract_tool.py hbfs.wav 2 2 bank_statement.pdf

tail -c 76196 ticket.jpg > club_statement.pdf

python3 extract_tool.py chant1.wav 4 2 supporters_statement.pdf

exiftool -b -comment daft_punk.gif > data.zip
unzip data.zip

