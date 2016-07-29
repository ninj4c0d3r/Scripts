#!/bin/bash
########################
#    nmapwn v.0.2       #
############################
# Jonatas FIL a.k.a [Ninj4]#
#################################
# https://github.com/ninj4c0d3r #
#################################
# https://ninj4c0d3r.github.io  #
#################################

# verifica se esta logado como root
Login(){
if [ "$(id -u)" != "0" ]; then
echo
echo "Welcome to nmapwn !!!"
sleep 2
echo -n "Digite sua senha : "
su -c "sh nmapwn.sh"
clear
else
echo "Ok !!!"
sleep 2
clear
fi
}


 # check if Nmap installation exists   
      if [ -d $find ]; then
      echo [*]:[Nmap]:installation found!;

else

   echo [x]:[warning]:this script require Nmap installed to work ;
   echo [!]:[please wait]: Downloading from network... ;
   sleep 3
      apt-get install nmap
      apt-get install whois
fi
sleep 1

echo "-> welcome <-"
sleep 2

# Menu principal
sh_Principal () {


cat <<!

          ╔╗╔┌┬┐┌─┐╔═╗┬ ┬┌┐┌
          ║║║│││├─┤╠═╝││││││
          ╝╚╝┴ ┴┴ ┴╩  └┴┘┘└┘      
         Nmap Auxiliary pwnable
#------------------------------------------#
# 1) - Scan TCP                            #
# 2) - Scan UDP                            #
# 3) - Scan RECON                          #
# 4) - Auxiliary modules                   #
# e) - Sair                                #
#------------------------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
	1) sh_tcp ;;
    2) sh_udp ;; 
    3) sh_recon ;;
    4) sh_aux ;;
    e) sh_sair ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; sh_Principal ;;  
esac
}
#########################################################
# submenu auxiliar
sh_aux () {
clear

cat <<!

          ╔╗╔┌┬┐┌─┐╔═╗┬ ┬┌┐┌
          ║║║│││├─┤╠═╝││││││
          ╝╚╝┴ ┴┴ ┴╩  └┴┘┘└┘      
         Nmap Auxiliary pwnable
#------------------------------------------#
# 1) - Devices in Network                  #
# 2) - ip-geolocation                      #
# 3) - Wordpress Users enum                #
# 4) - http-shellshock                     #
# 5) - http-iis-webdav-vuln                #
# 6) - directory scan                      #
# 7) - ftp-anon scan                       #
# 8) - dns-fuzz                            #
# 9) - joomla-3_4_5 vuln                   #
# b) - Voltar                              #
#------------------------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
	1) sh_dev ;;
    2) sh_geo ;; 
    3) sh_word ;;
    4) sh_shell ;;
    5) sh_webdav ;;
    6) sh_dir ;; 
    7) sh_ftp ;;
    8) sh_dns ;;
    9) sh_joom ;;
    b) sh_back ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; sh_aux ;;  
esac
}
################################################################
# scripts
sh_dev () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sP $IP/24 -v
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_geo () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap --script ip-geolocation-geoplugin $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_word () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -p80 --script http-wordpress-users $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_shell () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sV -p- --script http-shellshock $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_webdav () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap --script http-iis-webdav-vuln -p80,8080 $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_dir () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sV --script=http-enum $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_ftp () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sV -sC $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_dns () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sU --script dns-fuzz --script-args timelimit=2h $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}

sh_joom () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sS -Pn -p 80 --script joomla-3_4_5.nse $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_aux

}
#######################################################################
# submenu recon
sh_recon () {
clear


cat <<!

          ╔╗╔┌┬┐┌─┐╔═╗┬ ┬┌┐┌
          ║║║│││├─┤╠═╝││││││
          ╝╚╝┴ ┴┴ ┴╩  └┴┘┘└┘      
         Nmap Auxiliary pwnable
#------------------------------------------#
# 1) - TraceRoute                          #
# 2) - OS Identify                         #
# 3) - PORT SPECIFICATION                  #
# 4) - Scan Services                       #
# 5) - TOP Ports                           #
# b) - Voltar                              #
#------------------------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
	1) sh_trace ;;
    2) sh_os ;; 
    3) sh_port ;;
    4) sh_serv ;; 
    5) sh_top ;;
    b) sh_back ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; sh_recon ;;  
esac
}
#####################################################################
# scripts
sh_trace () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sn --traceroute $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_recon

}

sh_os () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -O -Pn $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_recon

}

sh_port () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   echo -n "please enter your port [23,80,443] :"
   read IP
   read port
   sudo nmap -sS -p $port $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_recon

}

sh_serv () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sV -Pn -v $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_recon

}

sh_top () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   echo -n "enter your number of ports [5, 3, 10, of top ports]:"
   read IP
   read ports
   sudo nmap -sS --top-ports $ports -v $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_recon

}
############################################################################
# submenu tcp
sh_tcp () {
clear


cat <<!

          ╔╗╔┌┬┐┌─┐╔═╗┬ ┬┌┐┌
          ║║║│││├─┤╠═╝││││││
          ╝╚╝┴ ┴┴ ┴╩  └┴┘┘└┘      
         Nmap Auxiliary pwnable
#------------------------------------------#
# 1) - Scan Fast                           #
# 2) - Scan Slow                           #
# 3) - Scan Complete                       #
# b) - Voltar                              #
#------------------------------------------#
!
	echo -n "Qual a opção desejada ? "
	read opcao
case $opcao in 
	1) sh_fast ;;
    2) sh_slow ;; 
    3) sh_comp ;;
    b) sh_back ;;

	*) echo "\"$opcao\" Opção inválida!"; sleep 2; sh_tcp ;;  
esac
}
##############################################################################
# scripts


sh_fast () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sT -F -v -Pn -T5 $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_tcp

}

sh_slow () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sS -Pn -v -T2 $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_tcp

}

sh_comp () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sS -A -v -Pn $IP
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_tcp

}



###################################################################
# scan udp
sh_udp () {
clear

   echo "Aguarde..."
  sleep 3
  clear
   echo -n "please enter your Target IP :"
   read IP
   sudo nmap -sU $IP -Pn -A 
   sleep 2
  echo -n "Deseja voltar para o Menu? (yes):"
   read yes
   clear
   sh_back

}
######################################################################
# voltar ao menu
sh_back () {
   clear
   echo "Aguarde, voltando ao menu principal."
   sleep 2
   clear
   sh_Principal

}

#################################################################



# sair do script
sh_sair () {
   echo "Saindo..."
   sleep 2
clear
exit
}
############################################
sh_Principal
