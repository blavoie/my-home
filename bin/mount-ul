#!/usr/bin/env bash
#
# Ce script permet de monter rapidement tous les partage UL d'intérêt.
# 

. ~/bin/configs

### S'assurer que les répertoires de montage sont existants.

sudo mkdir -p $UL_MOUNT_BASE/ena-prod_logs
sudo mkdir -p $UL_MOUNT_BASE/ena-server-prod0{1,2,3,4,5}-{a,b}_logs

### Effectuer le montage des partages.
# TODO: dynamiser avec une boucle et une liste de partages à monter.

# Log Server

sudo mount.cifs //ul-ora-pr-log01.ul.ca/ena-prod_logs /mnt/ul/ena-prod_logs/ -o credentials=~/bin/credentials.ul

# Live Shares

sudo mount.cifs //ul-ena-pr-wls01.ul.ca/ena-server-prod01-a_logs $UL_MOUNT_BASE/ena-server-prod01-a_logs -o credentials=~/bin/credentials.ul
sudo mount.cifs //ul-ena-pr-wls01.ul.ca/ena-server-prod01-b_logs $UL_MOUNT_BASE/ena-server-prod01-b_logs -o credentials=~/bin/credentials.ul

sudo mount.cifs //ul-ena-pr-wls02.ul.ca/ena-server-prod02-a_logs $UL_MOUNT_BASE/ena-server-prod02-a_logs -o credentials=~/bin/credentials.ul
sudo mount.cifs //ul-ena-pr-wls02.ul.ca/ena-server-prod02-b_logs $UL_MOUNT_BASE/ena-server-prod02-b_logs -o credentials=~/bin/credentials.ul

sudo mount.cifs //ul-ena-pr-wls03.ul.ca/ena-server-prod03-a_logs $UL_MOUNT_BASE/ena-server-prod03-a_logs -o credentials=~/bin/credentials.ul
sudo mount.cifs //ul-ena-pr-wls03.ul.ca/ena-server-prod03-b_logs $UL_MOUNT_BASE/ena-server-prod03-b_logs -o credentials=~/bin/credentials.ul

sudo mount.cifs //ul-ena-pr-wls04.ul.ca/ena-server-prod04-a_logs $UL_MOUNT_BASE/ena-server-prod04-a_logs -o credentials=~/bin/credentials.ul
sudo mount.cifs //ul-ena-pr-wls04.ul.ca/ena-server-prod04-b_logs $UL_MOUNT_BASE/ena-server-prod04-b_logs -o credentials=~/bin/credentials.ul

sudo mount.cifs //ul-ena-pr-wls05.ul.ca/ena-server-prod05-a_logs $UL_MOUNT_BASE/ena-server-prod05-a_logs -o credentials=~/bin/credentials.ul
sudo mount.cifs //ul-ena-pr-wls05.ul.ca/ena-server-prod05-b_logs $UL_MOUNT_BASE/ena-server-prod05-b_logs -o credentials=~/bin/credentials.ul
