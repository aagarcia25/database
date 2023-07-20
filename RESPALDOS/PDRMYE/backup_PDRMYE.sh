#!bin/bash
USER="root"
PASSWORD="xQRA0xBC87Gs"
DATABASE="PDRMYE"
DIA_NUM=$(date +%d%m%y)
echo $DIA_NUM
echo $USER
echo $PASSWORD
echo $DATABASE
mysqldump --user='root' --password="xQRA0xBC87Gs" "PDRMYE"  > "//home/Respaldo/database/RESPALDOS/PDRMYE/${DIA_NUM}"
cd /home/Respaldo/database/
git pull
git commit -m "Respaldo PDRMYE"
git push origin main
