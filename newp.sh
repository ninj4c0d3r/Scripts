#!/bin/bash
########################
# NewP By Jonatas FIL  #
########################
#Gr33tz: Jonathas Melo(hlof)#
###########################################
#https://sourceforge.net/u/dark00x1n/wiki #
###########################################


#Config
 Colors() {
Escape="\033";
  white="${Escape}[0m";
  RedF="${Escape}[31m";
  GreenF="${Escape}[32m";
  YellowF="${Escape}[33m";
  BlueF="${Escape}[34m";
  CyanF="${Escape}[36m";
Reset="${Escape}[0m";
}

 # check if Nmap installation exists   
      if [ -d $find ]; then
      Colors;
      echo ${BlueF}[*]${RedF}:${BlueF}[Nmap]:${white}installation found!${Reset};

else

   Colors;
   echo ${RedF}[x]:[warning]:this script require Nmap installed to work ${Reset};
   echo ${GreenF}[!]${RedF}:${GreenF}[please wait]: Downloading from network... ${Reset};
   sleep 3
      apt-get install nmap
      apt-get install zenmap
fi
sleep 1

echo "-> Bem-vindo! <-"
sleep 2
#HUHU CURIOSO
sh_Principal () {

Colors;

cat <<!
             Newp  v1.0
#------------------------------------------#
# 1) - Rede Infos  -   2) - Roteador Infos #  
#             e) - Sair                    #
#------------------------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
	1) sh_rede ;;
    2) sh_rot ;; 
    e) sh_sair ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; sh_Principal ;;  
esac
}
Colors;
#VEMMONSTRO
sh_rot () {

   Colors;
   echo "Aguarde, ira listar as informações de seu roteador:"
  sleep 3
  clear
   route -n | head -n 3 && iwconfig | head -n 8
   sleep 2
  echo -n "Deseja voltar para o menu principal? (yes):"
   read yes
   clear
   sh_Principal

  
}

Colors;
#ÉOQ MALUCO
sh_listar () {

   Colors;
   echo "Aguarde, ira listar os dispositivos em sua rede:"
  sleep 3
  clear
   echo -n "please enter your IP Local (ifconfig):"
   read Local
   sudo nmap -sP $Local/24
   sleep 2
  echo -n "Deseja voltar para Opções de rede? (yes):"
   read yes
   clear
   sh_rede

  
}
Colors;
#ESPERANDO A MARIA JOAQUINA CRESCER
sh_scan () {

   Colors;
   echo "Aguarde, o Scan está sendo preparado..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sS $IP -O
   sleep 2
  echo -n "Deseja voltar para Opções de rede? (yes):"
   read yes
   clear
   sh_rede

  
}
Colors;
#GIL PASSOU AQUI ooops ( rogeria)
sh_rede () {
clear
cat <<!
-------------------------------------#
1) - Procurar por dispositivos(NMAP) #
2) - Scanear um Dispositivo(NMAP)    #
b) - voltar ao menu                  #
-------------------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
   1) sh_listar ;;
   2) sh_scan ;; 
   b) sh_back ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; sh_Principal ;;  
esac
}
sh_Principal () {
Colors;
cat <<!
               Newp  v1.0
#------------------------------------------#
# 1) - Rede Infos  -   2) - Roteador Infos #  
#             e) - Sair                    #
#------------------------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
	1) sh_rede ;;
    2) sh_rot ;; 
    e) sh_sair ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; sh_Principal ;;  
esac
}
sh_back () {
   Colors;
   clear
   echo "Aguarde, voltando ao menu principal."
   sleep 2
   clear
   sh_Principal

}
Colors ;
#SEULBULCETA
sh_sair () {
   echo -e "[\033[01;32m*\033[00;37m] Saindo..."
   sleep 2
clear
exit
}
sh_Principal