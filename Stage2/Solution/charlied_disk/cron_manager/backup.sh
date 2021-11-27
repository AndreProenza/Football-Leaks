#!/bin/bash -l

cd /home/charlied/password_gen

timestamp() {
    date +%s # current time unix timestamp
}

unix_date=$(timestamp)

USER=charlied
HOST=backup-server
DIR=~
ZIPFILE=backup_$unix_date.zip
BACKUP_PASS=$(python3 obfuscator $unix_date)

cd /home/charlied/cron_manager

zip -r --password $BACKUP_PASS $ZIPFILE /home/charlied/
rsync -a /home/charlied/cron_manager/$ZIPFILE $USER@$HOST:$DIR
rm $ZIPFILE
