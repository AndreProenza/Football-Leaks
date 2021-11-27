#!/bin/bash

EVIDENCES=../Evidences
CHARLIED_DISK=../charlied_disk.img
BACKUP_DISK=../backup_disk.img

createCharliedDiskDirectories ()
{
    echo "---------------------------------------"
    echo "  Creating Charlied Disk Directories   "

    mkdir $EVIDENCES/charlied_disk
    mkdir $EVIDENCES/charlied_disk/cron_manager
    mkdir $EVIDENCES/charlied_disk/irclogs
    mkdir $EVIDENCES/charlied_disk/password_gen

    echo -e "---------------------------------------\n"
}

createBackupDiskDirectories ()
{
    echo "---------------------------------------"
    echo "  Creating Backup Disk Directories   "

    mkdir $EVIDENCES/backup_disk

    echo -e "---------------------------------------\n"
}

extractFiles ()
{
    echo "--------------------------------------------------"
    echo "Extracting files from charlied_disk.img -o 1052672"
    echo -e "--------------------------------------------------\n"

    # To directory password_gen
    icat -o 1052672 $CHARLIED_DISK 557188 > $EVIDENCES/charlied_disk/password_gen/seeds.txt 
    icat -o 1052672 $CHARLIED_DISK 264702 > $EVIDENCES/charlied_disk/password_gen/obfuscator 

    # To directory cron_manager
    icat -o 1052672 $CHARLIED_DISK 423847 > $EVIDENCES/charlied_disk/cron_manager/backup.sh 

    # To directory charlied_disk
    icat -o 1052672 $CHARLIED_DISK 395585 > $EVIDENCES/charlied_disk/bash_history.txt 
 
    # To directory irclogs
    icat -o 1052672 $CHARLIED_DISK 422314 > $EVIDENCES/charlied_disk/irclogs/2021-EFNet-auth.10-16.log 
    icat -o 1052672 $CHARLIED_DISK 422315 > $EVIDENCES/charlied_disk/irclogs/2021-EFNet-#lrh.10-16.log 
    icat -o 1052672 $CHARLIED_DISK 404770 > $EVIDENCES/charlied_disk/irclogs/2021-EFNet-chapman13.10-16.log

    # To directory charlied_disk
    icat -o 1052672 $CHARLIED_DISK 552397 > $EVIDENCES/charlied_disk/INBOX

    echo "--------------------------------------------------"
    echo "Extracting files from backup_disk.img -o 2048"
    echo -e "--------------------------------------------------\n"

    # To backup_disk directory
    icat -o 2048 $BACKUP_DISK 168635 > $EVIDENCES/backup_disk/backup_1634405485.zip
    icat -o 2048 $BACKUP_DISK 168646 > $EVIDENCES/backup_disk/backup_1634412601.zip
    icat -o 2048 $BACKUP_DISK 168650 > $EVIDENCES/backup_disk/backup_1634414401.zip

    icat -o 2048 $BACKUP_DISK 136657 > $EVIDENCES/backup_disk/bash_history.txt
    
    echo "Files extracted to Evidences/...     "
    echo -e "--------------------------------------------------\n"
}

temp_bash()
{
    cd $EVIDENCES/backup_disk/
    touch temp.sh
    echo "#!/bin/bash" > temp.sh
    echo "unzip -P $1 $2" > temp.sh
    bash temp.sh
    mv home/ $3
    rm temp.sh
    cd ../../Tools/
}

zipExtraction ()
{
    echo "--------------------------------------------------"
    echo "Unziping backup_disk zips..."
    echo -e "--------------------------------------------------\n"

    echo "Unziping backup_1634414401.zip..."
    echo "It may take some time..."
    python3 unobfuscator.py 1634414401
    ./zipcracker-ng -f $EVIDENCES/backup_disk/backup_1634414401.zip -w wordlist.txt > password.txt
    # python3 crack_zip.py 1634414401
    PASSWORD1=$(python3 crack_zip.py 1634414401)
    temp_bash "$PASSWORD1" "backup_1634414401.zip" "backup_1634414401_extracted/"
    echo -e "Sucess\n"

    echo "Unziping backup_1634405485.zip..."
    echo "It may take some time..."
    python3 unobfuscator.py 1634405485
    ./zipcracker-ng -f $EVIDENCES/backup_disk/backup_1634405485.zip -w wordlist.txt > password.txt
    # python3 crack_zip.py 1634405485
    PASSWORD2=$(python3 crack_zip.py 1634405485)
    temp_bash "$PASSWORD2" "backup_1634405485.zip" "backup_1634405485_extracted/"
    echo -e "Sucess\n"

    echo "Unziping backup_1634412601.zip..."
    echo "It may take some time..."
    python3 unobfuscator.py 1634412601
    ./zipcracker-ng -f $EVIDENCES/backup_disk/backup_1634412601.zip -w wordlist.txt > password.txt
    # python3 crack_zip.py 1634412601
    PASSWORD3=$(python3 crack_zip.py 1634412601)
    temp_bash "$PASSWORD3" "backup_1634412601.zip" "backup_1634412601_extracted/"
    echo -e "Sucess\n"

    rm password.txt
    rm wordlist.txt
    clear

    echo "--------------------------------------------------"
    echo "Unziping backup_disk zips..."
    echo -e "--------------------------------------------------\n"

    echo "Unziping backup_1634414401.zip..."
    echo -e "Sucess\n"

    echo "Unziping backup_1634405485.zip..."
    echo -e "Sucess\n"

    echo "Unziping backup_1634412601.zip..."
    echo -e "Sucess\n"

    echo "--------------------------------------------------"
    echo "         Passwords used for extraction"
    echo -e "--------------------------------------------------\n"

    echo -e "backup_1634414401.zip unziped with password: $PASSWORD1\n"
    echo -e "backup_1634405485.zip unziped with password: $PASSWORD2\n"
    echo -e "backup_1634412601.zip unziped with password: $PASSWORD3\n"

    echo "Files unziped to Evidences/backup_disk/...     "
    echo -e "--------------------------------------------------\n"
}

moveRhfc()
{
    echo "--------------------------------------------------"
    echo "            Check Evidences folder                "
    echo -e "--------------------------------------------------\n"

    cp -r $EVIDENCES/backup_disk/backup_1634412601_extracted/charlied/rhfc/ $EVIDENCES/
}

# Install sleuthkit if not already installed.
if [ "$1" = "-y" ]
then
    echo "---------------------------------------"
    echo -e "           Installing Tools            \n"

    sudo apt-get install sleuthkit

    echo -e "---------------------------------------\n"
    
    createCharliedDiskDirectories
    createBackupDiskDirectories
    extractFiles
    zipExtraction
    moveRhfc
elif [ "$1" = "-n" ]
then
   createCharliedDiskDirectories
   createBackupDiskDirectories
   extractFiles
   zipExtraction
   moveRhfc
else
    echo "usage: bash generateEvidences.sh [install tools]
    bash generateEvidences.sh -y
    bash generateEvidences.sh -n
    Note: sleuthkit required"
fi



