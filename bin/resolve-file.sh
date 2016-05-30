#!/usr/bin/env bash
#
# Ce script permet de résoudre l'adresse IP des hôtes contenues dans un fichier.
#
# Invoquation: ./resolve.sh <nom-fichier>
#

while read p; do
  nslookup  $p
done < $1

