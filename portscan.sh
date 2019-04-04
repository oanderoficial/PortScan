#!/usr/bin/env bash

#Acesso ROOT.

[ $UID -ne '0' ] && { echo "Necessário ter Acesso ROOT."; exit 1 ;}

export LANG=C.UTF-8

lightgreen='\e[1;32m'
white='\e[1;37m'
BlueF='\e[1;34m'
red='\e[1;31m'

       cat <<exp
              ___  ____  ___  ______  ____________   _  __
             / _ \/ __ \/ _ \/_  __/ / __/ ___/ _ | / |/ /
            / ___/ /_/ / , _/ / /   _\ \/ /__/ __ |/    /
           /_/   \____/_/|_| /_/   /___/\___/_/ |_/_/|_/

                        By Anderson.b.Silva

exp

menu()
{
   echo -e "\t\t\t $lightgreen PortSCAN v1.0\n"
   echo -e "\t$lightgreen[1]$white Verificar quais as portas que estão abertas no sistema : \n"
   echo -e "\t$lightgreen[2]$white Port Scan varredura de portas para coleta de informações :\n"
   echo -e "\t$lightgreen[3]$white Sniffar uma Determinada porta :\n"
   echo -e "\t$lightgreen[4]$white Whois :\n"
   echo -e "\t$lightgreen[5]$white sair\n"
   echo -e "\t$lightgreen Escolha[1/2/3/4/5]?"
   echo -e "$white"
   echo -n -e $BlueF'  \t Port@SCAN:\033[0m >> '; tput sgr0
   read menu2

case $menu2 in
  1) portas;;
  2) PortScan;;
  3) Sniffar;;
  4) sites;;
  5) sair;;
  *) echo -e $red'opicão invalida, tente novamente!'&&sleep 2&&menu;;
esac
}
echo -e "$white"
function portas () {
   echo -n -e $BlueF'  \t Port@SCAN:\033[0m >> '; tput sgr0
   echo -e "\tDigite o ip:\n"
   read portas
   echo `nmap -v $portas`
   print
}

function PortScan () {
   echo -n -e $BlueF'  \t Port@SCAN:\033[0m >> '; tput sgr0
   echo -e "\tDigite o ip: \n"
   read PortScan
   echo -e `nc -z -v $PortScan 1.30`
}

function Sniffar () {
   echo -n -e $BlueF'  \t Port@SCAN:\033[0m >> '; tput sgr0
   echo -e "\tDigite o ip :\n "
   read Sniffar
   echo -e "\tDigite a porta:\n"
   read porta
   echo `netcat -vv -l $Sniffar -p $porta`
}

function sites () {
   echo -n -e $BlueF'  \t Port@SCAN:\033[0m >> '; tput sgr0
   echo -e "\tDigite o Site. Exemplo nmap.org"
   read sites
   echo `whois $sites`
 }

function sair()
{
   echo -e "\tPressione [Enter] para Sair .............."&&read&&exit 0
}
menu
