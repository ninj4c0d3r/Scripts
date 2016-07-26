#!/bin/bash
###########################################
#__        ___ _    _ ____   ___  ____    #
#\ \      / (_) | _(_)  _ \ / _ \/ ___|   #
# \ \ /\ / /| | |/ / | | | | | | \___ \   #
#  \ V  V / | |   <| | |_| | |_| |___) |  #
#   \_/\_/  |_|_|\_\_|____/ \___/|____/   #
###########################################
#  Criado por Jonatas Fil (dark00x1n)     #
#  https://sourceforge.net/u/dark00x1n/   #
#                ENJOY                    #
###########################################
 
 #Config
 # check if links installation exists   
      if [ -d $find ]; then
      echo [*]:[links]:installation found!

else

  
   echo [x]:[warning]:this script require Nmap installed to work 
   echo [!]:[please wait]: Downloading from network... 
   sleep 3
      apt-get install links
    
fi
sleep 2

clear
cat <<!
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMM        MMMMMMMMMMMM
MMMMMMMMMM            MMMMMMMMMM
MMMMMMMMM              MMMMMMMMM
MMMMMMMM                MMMMMMMM
MMMMMMM                 MMMMMMMM
MMMMMMM                  MMMMMMM
MMMMMMM                  MMMMMMM
MMMMMMM    MMM    MMM    MMMMMMM
MMMMMMM   MMMMM   MMMM   MMMMMMM
MMMMMMM   MMMMM   MMMM   MMMMMMM
MMMMMMMM   MMMM M MMMM  MMMMMMMM
MMVKMMMM        M        MMMMMMM
MMMMMMMM       MMM      MMMMMMMM
MMMMMMMMMMMM   MMM  MMMMMMMMMMMM
MMMMMMMMMM MM       M  MMMMMMMMM
MMMMMMMMMM  M M M M M MMMMMMMMMM
MMMM  MMMMM MMMMMMMMM MMMMM   MM
MMM    MMMM M MMMMM M MMMM    MM
MMM    MMMM   M M M  MMMMM   MMM
MMMM    MMMM         MMM      MM
MMM       MMMM     MMMM       MM
MMM         MMMMMMMM      M  MMM
MMMM  MMM      MMM      MMMMMMMM
MMMMMMMMMMM  MM       MMMMMMM  M
MMM  MMMMMMM       MMMMMMMMM   M
MM    MMM        MM            M
MM            MMMM            MM
MMM        MMMMMMMMMMMMM       M
MM      MMMMMMMMMMMMMMMMMMM    M
MMM   MMMMMMMMMMMMMMMMMMMMMM   M
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
###########################################
#__        ___ _    _ ____   ___  ____    #
#\ \      / (_) | _(_)  _ \ / _ \/ ___|   #
# \ \ /\ / /| | |/ / | | | | | | \___ \   #
#  \ V  V / | |   <| | |_| | |_| |___) |  #
#   \_/\_/  |_|_|\_\_|____/ \___/|____/   #
###########################################
#  Criado por Jonatas Fil (dark00x1n)     #
#  https://sourceforge.net/u/dark00x1n/   #
#                ENJOY                    #
###########################################
!
sleep 2
echo -n "Você deseja ver a Biografia de quem ou oquê?(exemplo:Adolf_Hitler,Hitler) :"
read Biografia
URL=https://pt.wikipedia.org/wiki/$Biografia
links -dump -html-tables 0 -html-frames 0 $URL >Output/biografia.txt
sleep 2
clear
echo "A biografia de "$Biografia" foi achada... para movimentar use as setas."
echo "."
echo ".."
echo "..."
sleep 3

clear
cat Output/biografia.txt&&echo -n "Deseja Sair da biografia? (yes):"
   read yes
   clear
   echo "Saindo..."
   sleep 1
   clear  
   exit
  

