#!/bin/sh
########################
#  IpTables Firewall
#       Ninj4
# Config By Jonatas Fil
########################
#      Bonus:
# How to install in system:
# chmod +x firewall.sh
# sudo mv firewall.sh /usr/bin
#
# and enjoy !!! :D
#

#sistema de login
Login(){
if [ "$(id -u)" != "0" ]; then
echo
echo "Bem Vindo Ao Firewall do Jonatas Fil !!!"
sleep 2
echo -n "Digite a senha root : "
su -c "sh firewall.sh"
clear
else
echo "Você esta logado !!!"
sleep 2
clear
fi
}

# check if iptables installation exists   
      if [ -d $find ]; then
      echo [*]:[xxd]:installation found!;

else

   echo [x]:[warning]:this script require iptables installed to work ;
   echo [!]:[please wait]: Downloading from network... ;
   sleep 3
      apt-get install iptables
fi
clear

#Inicio
echo "Bem vindo ao Firewall Ninj4 !!!!"
sleep 2

sh_Principal () {



cat <<!
                Firewall Ninj4
           By Jonatas Fil [Ninj4]
    TheCybers Team / 0wnz / CTF-BR
#------------------------------------------#
# 1) - Firewall Básico                     #
# 2) - Firewall Avançado                   #
# 3) - Desligar Firewall                   #  
# e) - Exit                                #
#------------------------------------------#
!
	echo -n "Select Your Choice ? "
	read opcao
case $opcao in 
    1) sh_begin ;;
    2) sh_hard ;; 
    3) sh_off ;; 
    e) sh_sair ;;

	*) echo "\"$opcao\" Invalid!"; sleep 2; sh_Principal ;;  
esac
}


sh_begin () {

echo "Regras Zeradas"
iptables -F
clear

echo "Seu Firewall básico está inicializando ..."
sleep 2
clear

iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -p tcp --destination-port 80 -j DROP
iptables -A INPUT -p tcp --destination-port 443 -j DROP
iptables -A INPUT -p tcp --destination-port 22 -j DROP
iptables -A INPUT -p tcp --destination-port 1234 -j DROP
iptables -A INPUT -p tcp --destination-port 21 -j DROP
iptables -A INPUT -p tcp --destination-port 12345 -j DROP
iptables -A INPUT -p tcp --destination-port 20 -j DROP
iptables -A INPUT -p tcp --destination-port 8084 -j DROP

echo "Carregando Logs"
sleep 2
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route # Impede falsear pacote
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects # Perigo de descobrimento de rotas de roteamento (desativar em roteador)
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts # Risco de DoS
echo 1 > /proc/sys/net/ipv4/tcp_syncookies # Só inicia a conexão quando recebe a confirmação, diminuindo a banda gasta
echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter # Faz o firewall responder apenas a placa de rede que recebeu o pacote
iptables -A INPUT -m state --state INVALID -j DROP # Elimina os pacotes invalidos

echo "Security 100% activate !!!!"

sleep 2

clear

sh_Principal
}

sh_hard () {

echo "Regras Zeradas"
iptables -F
clear

echo "Seu Firewall Avançado está inicializando ..."
sleep 2
echo "A partir de agora nada sai e nada entra, sem ataques DoS, DDoS :D !!!"
sleep 2
clear
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

echo "Carregando Logs"
sleep 2
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route # Impede falsear pacote
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects # Perigo de descobrimento de rotas de roteamento (desativar em roteador)
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts # Risco de DoS
echo 1 > /proc/sys/net/ipv4/tcp_syncookies # Só inicia a conexão quando recebe a confirmação, diminuindo a banda gasta
echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter # Faz o firewall responder apenas a placa de rede que recebeu o pacote
iptables -A INPUT -m state --state INVALID -j DROP # Elimina os pacotes invalidos



echo "Security 100% activate !!!!"

sleep 2

clear

sh_Principal
}
sh_off () {

echo "Firewall está sendo desligado..."
sleep 3

#regras
iptables -F
iptables -X
iptables -t mangle -F
#politicas
iptables -P INPUT   ACCEPT
iptables -P OUTPUT  ACCEPT
iptables -P FORWARD ACCEPT

echo "Firewall Ninj4 desligado."
sleep 2
clear
sh_Principal
}

sh_sair () {
   clear
   echo "Saindo..."
   sleep 2
clear
exit
}

sh_Principal
