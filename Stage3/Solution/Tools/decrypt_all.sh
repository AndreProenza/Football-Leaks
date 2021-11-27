#!/bin/bash

PACKAGES=../Evidences/Packages
PACKAGES_DECRYPTED=../Evidences/Packages-Decrypted

cp decrypt.py $PACKAGES/

echo "----------------------------------------"
echo -e "         Decrypting packages...         \n"


#EXEC
echo "Decrypting 140401-exec --> 140401-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140401-exec

echo "Decrypting 140426-exec --> 140426-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140426-exec

echo "Decrypting 140452-exec --> 140452-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140452-exec

echo "Decrypting 140480-exec --> 140480-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140480-exec

echo "Decrypting 140508-exec --> 140508-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140508-exec

echo "Decrypting 140537-exec --> 140537-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140537-exec

echo "Decrypting 140568-exec --> 140568-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140568-exec

echo "Decrypting 140600-exec --> 140600-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140600-exec

echo "Decrypting 140709-exec --> 140709-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140709-exec

echo "Decrypting 140832-exec --> 140832-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140832-exec

echo "Decrypting 140872-exec --> 140872-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140872-exec

echo "Decrypting 140997-exec --> 140997-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140997-exec

echo "Decrypting 141026-exec --> 141026-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/141026-exec

echo "Decrypting 141058-exec --> 141058-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/141058-exec

echo "Decrypting 141151-exec --> 141151-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/141151-exec

echo "Decrypting 141180-exec --> 141180-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/141180-exec

echo "Decrypting 142047-exec --> 142047-exec.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/142047-exec


#CMD
echo "Decrypting 140409-cmd  --> 140409-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140409-cmd

echo "Decrypting 140438-cmd  --> 140438-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140438-cmd

echo "Decrypting 140464-cmd  --> 140464-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140464-cmd

echo "Decrypting 140489-cmd  --> 140489-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140489-cmd

echo "Decrypting 140518-cmd  --> 140518-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140518-cmd

echo "Decrypting 140546-cmd  --> 140546-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140546-cmd

echo "Decrypting 140576-cmd  --> 140576-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140576-cmd

echo "Decrypting 140840-cmd  --> 140840-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/140840-cmd

echo "Decrypting 141006-cmd  --> 141006-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/141006-cmd

echo "Decrypting 141035-cmd  --> 141035-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/141035-cmd

echo "Decrypting 141160-cmd  --> 141160-cmd.txt"
python3 $PACKAGES/decrypt.py $PACKAGES/141160-cmd


#FILE
echo "Decrypting 140670-file --> Club_Memo.pdf"
python3 $PACKAGES/decrypt.py $PACKAGES/140670-file

echo "Decrypting 140807-file --> Official_Supporters_Statement.pdf"
python3 $PACKAGES/decrypt.py $PACKAGES/140807-file

echo "Decrypting 140979-file --> Club_Statement.pdf"
python3 $PACKAGES/decrypt.py $PACKAGES/140979-file

echo "Decrypting 141113-file --> Bank_Statement.pdf"
python3 $PACKAGES/decrypt.py $PACKAGES/141113-file

echo "Decrypting 142061-file --> James_Santos_Profile.pdf"
python3 $PACKAGES/decrypt.py $PACKAGES/142061-file


#RENAME FILES
mv $PACKAGES/140670-file.pdf $PACKAGES/Club_Memo.pdf
mv $PACKAGES/140807-file.pdf $PACKAGES/Official_Supporters_Statement.pdf
mv $PACKAGES/140979-file.pdf $PACKAGES/Club_Statement.pdf
mv $PACKAGES/141113-file.pdf $PACKAGES/Bank_Statement.pdf
mv $PACKAGES/142061-file.pdf $PACKAGES/James_Santos_Profile.pdf


echo -e "----------------------------------------\n"

mv $PACKAGES/*.txt $PACKAGES_DECRYPTED/
mv $PACKAGES/*.pdf $PACKAGES_DECRYPTED/
rm $PACKAGES/decrypt.py