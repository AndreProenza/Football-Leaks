#!/bin/bash

# Extract hidden files from given files
extract () {
    echo "---------------------------------------"
    echo -e "   Extracting hidden files/documents   \n"

    # Extract/Recover hidden files
    foremost -i ../ticket.jpg -o ../Evidences/ticket
    mv ../Evidences/ticket/pdf/00000154.pdf ../Evidences/club_statement.pdf
    rm -r ../Evidences/ticket


    # Extract James_Santos_profile.pdf
    exiftool -comment ../daft_punk.gif -b > ../Evidences/file.zip && unzip ../Evidences/file.zip -d ../Evidences/
    rm ../Evidences/file.zip

    echo -e "---------------------------------------\n"
}

# Crack chants.zip using SNA_Lyrics_words.txt file which contains the 
# Seven Nation Army lyrics, one word per line.
crackzip () {
    echo "---------------------------------------"
    echo "         Cracking chants.zip           "
    fcrackzip -u -D -p SNA_Lyrics_words.txt ../chants.zip
    fcrackzip -u -D -p SNA_Lyrics_words.txt ../chants.zip > ../Evidences/chantsZipPassword.txt
    python3 crackChantsZip.py
    mv ../Evidences/chant2 ../Evidences/internal_comunication.pdf
    echo -e "---------------------------------------\n"
}

#Recovers payload from hbfs.wav and chant1.wav
recoverWavs ()
{
    echo "---------------------------------------"
    echo "   Recovering payload from hbfs.wav    "
    echo "       It may take some time...        "
    python3 recoverWav.py recover ../hbfs.wav 2 2
    mv lsb2-2.txt hbfs-lsb2-2.txt
    mv hbfs-lsb2-2.txt ../Evidences/
    foremost -i ../Evidences/hbfs-lsb2-2.txt -o ../Evidences/hbfs-lsb2-2
    mv ../Evidences/hbfs-lsb2-2/pdf/00000000.pdf ../Evidences/statement_of_account.pdf
    rm -r ../Evidences/hbfs-lsb2-2
    echo "     Recovered payload sucessfully     "
    echo -e "---------------------------------------\n"

    echo "---------------------------------------"
    echo "   Recovering payload from chant1.wav "
    echo "       It may take some time...        "
    python3 recoverWav.py recover ../Evidences/chant1.wav 2 4
    mv lsb2-4.txt chant1-lsb2-4.txt
    mv chant1-lsb2-4.txt ../Evidences/
    foremost -i ../Evidences/chant1-lsb2-4.txt -o ../Evidences/chant1-lsb2-4
    mv ../Evidences/chant1-lsb2-4/pdf/00000000.pdf ../Evidences/official_supporters_statement.pdf
    rm -r ../Evidences/chant1-lsb2-4
    echo "     Recovered payload sucessfully     "
    echo -e "---------------------------------------\n"
}

# Install foremost, exiftool and fcrackzip if not already installed.
if [ "$1" = "-y" ]
then
    echo "---------------------------------------"
    echo -e "           Installing Tools            \n"
    sudo apt install foremost
    sudo apt install libimage-exiftool-perl
    sudo apt install fcrackzip
    echo -e "---------------------------------------\n"
    extract
    crackzip
    recoverWavs
elif [ "$1" = "-n" ]
then
    extract
    crackzip
    recoverWavs
else
    echo "usage: bash generateEvidences.sh [install tools]
    bash generateEvidences.sh -y
    bash generateEvidences.sh -n
    Note: foremost, exiftool and fcrackzip required"
fi



