#!/usr/bin/env bash

nodes=("ul-ena-pr-wls01.ul.ca" "ul-ena-pr-wls02.ul.ca" "ul-ena-pr-wls03.ul.ca" "ul-ena-pr-wls04.ul.ca" "ul-ena-pr-wls05.ul.ca")


BOLD=$(tput bold)
NORMAL=$(tput sgr0) 
YELLOW=$(tput setaf 3) 

for node in "${nodes[@]}"
do  
    echo "${BOLD}--------------------------------------------------------------------------${NORMAL}" 
    echo "${BOLD}-- Exécution de la commande demandée sur: ${YELLOW} $node - A${NORMAL}" 
    echo "${BOLD}--------------------------------------------------------------------------${NORMAL}" 
    java -jar ~/bin/sjk-plus-0.4.2.jar mx -s $node:7091 -mg -b ca.ulaval.ena:name=dataSource -f SurveillanceActive
    java -jar ~/bin/sjk-plus-0.4.2.jar mx -s $node:7091 -mg -b ca.ulaval.ena:name=dataSource -f SeuilMillisObtentionConnexion
 
    echo "${BOLD}--------------------------------------------------------------------------${NORMAL}" 
    echo "${BOLD}-- Exécution de la commande demandée sur: ${YELLOW} $node - B${NORMAL}" 
    echo "${BOLD}--------------------------------------------------------------------------${NORMAL}" 
    
    java -jar ~/bin/sjk-plus-0.4.2.jar mx -s $node:7092 -mg -b ca.ulaval.ena:name=dataSource -f SurveillanceActive
    java -jar ~/bin/sjk-plus-0.4.2.jar mx -s $node:7092 -mg -b ca.ulaval.ena:name=dataSource -f SeuilMillisObtentionConnexion
    echo ""
done


