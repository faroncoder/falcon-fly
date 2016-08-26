#!/bin/bash
fg_black=`tput setaf 0  2> /dev/null `
fg_red=`tput setaf 1  2> /dev/null `
fg_green=`tput setaf 2  2> /dev/null `
fg_yellow=`tput setaf 3  2> /dev/null `
fg_blue=`tput setaf 4  2> /dev/null `
fg_magenta=`tput setaf 5  2> /dev/null `
fg_cyan=`tput setaf 6  2> /dev/null `
fg_white=`tput setaf 7  2> /dev/null `
reset=`tput sgr0  2> /dev/null `
Fred=$( echo -e $fg_red  )
Fblack=$( echo -e $fg_black  )
Fgreen=$( echo -e $fg_green  )
Fyellow=$( echo -e $fg_yellow  )
Fblue=$( echo -e $fg_blue  )
Fpurple=$( echo -e $fg_magenta  )
Fteal=$( echo -e $fg_cyan  )
Fwhite=$( echo -e $fg_white  )
Foff=$( echo -e $reset  )
Fok="[$Fgreen OK $Foff]"
Fno="[$Fred ERR $Foff]"
Finfo="[$Fblue INFO $Foff]"
Fwarn="[$Fyellow WARN $Foff]"
Fstat="[$Fteal Status $Foff]"

SUDO="sudo"

$SUDO apt-get dist-upgrade;
$SUDO apt-get autoremove;
$SUDO apt-get update;

echo -e "$Fwarn chmoding /usr/local to $USER"
$SUDOchown -R $USER:$USER /usr/local
cd $HOME 2> /dev/null;
PACKAGES=( apache2 apache2-bin apache2-data uuid xclip trash-cli git mediainfo php-mongodb mongodb apache2-dev apache2-util autoconf automake build-essential cmake dh-php7.0 libapache2-mod-php7.0 libass-dev libfreetype6-dev libmp3lame-dev libopus-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx264-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev mercurial php7.0 php7.0-cgi php7.0-cli php7.0-common php7.0-curl php7.0-dev php7.0-exactimage php7.0-fpm php7.0-gd php7.0-geoip php7.0-imagick php7.0-imap php7.0-json php7.0-mcrypt php7.0-memcache php7.0-memcached php7.0-mongo php7.0-mysql php7.0-oauth php7.0-readline php7.0-sqlite php7.0-xcache php7.0-xmlrpc pkg-config texinfo yasm zlib1g-dev )
LOCATION="$HOME/.falcon/scripts"
if [[ ! -d "$HOME/.falcon" ]]; then
	mkdir "$HOME/.falcon" -p
	echo -e "$Fwarn directory for .falcon created"
	ln -s "$HOME/.falcon" "$HOME/falcon"  2> /dev/null;
	echo "link to this folder created for easy indexing"
fi
if [[ ! -d "$HOME/.ssh" ]]; then
	mkdir "$HOME/.ssh" -p 2> /dev/null;
	echo "$Fwarn .ssh created"
fi
if [[ ! -f "$HOME/.ssh/id_rsa" ]]; then
	echo "$Fwarn creating keygen..."
	ssh-keygen
	ssh-copy-id -i "$HOME/.ssh/id_rsa" faron@192.168.1.8
fi
if [[ ! -d "$HOME/.falcon/scripts" ]]; then
		if [[ "$( hostname -s  )" == "f8" ]]; then
			$SUDO sed -i -e '/sublime-text-3/d' /etc/fstab
			mkdir /home/users/faron/.config/sublime-text-3 -p
			$SUDO sh -c "echo \"/home/users/faron/.config/sublime-text-3  /home/users/faron/.falcon/scripts/files/Sublime  none  bind 0 0 \" >> /etc/fstab"
			$SUDO mount -a
			echo "$Fwarn Configuring Snippets to Sublime"
		else
			mv $HOME/.falcon/scripts $HOME/.falcon/old_scripts
			echo "$Fwarn initating copy master scripts"
			scp -r "faron@192.168.1.8:/home/users/faron/.falcon/scripts" "$HOME/.falcon/"
			rm -r $HOME/.falcon/.git
		fi
fi
if [[ ! -f "/usr/local/bin/ff.load" ]]; then
	cd /usr/local/bin 2> /dev/null;
	ln -s $HOME/.falcon/scripts/bin/ff.load.sh ff.load 2> /dev/null;
	echo "$Fwarn ff.load installed"
fi
if [[ ! -d "/usr/local/lib/faron_falcon" ]]; then
	cd /usr/local/lib 2> /dev/null;
	ln -s $HOME/.falcon/scripts/bash/lib faron_falcon 2> /dev/null;
	echo "$Fwarn link to 'faron_falcon' created for cross-scripting lib"
fi
cd $HOME 2> /dev/null;
rm "$HOME/.profile" 2> /dev/null;
ln -s $LOCATION/bash/.profile 2> /dev/null;
echo "$Fwarn .profile linked"
rm "$HOME/.bashrc" 2> /dev/null;
ln -s $LOCATION/bash/.bashrc 2> /dev/null;
echo "$Fwarn .bashrc linked"
`source ~/.profile`
/usr/local/bin/ff.load
echo "$Fwarn installing Falcon's default apts"
PACKAGES=( apache2 apache2-bin apache2-data apache2-dev apache2-util autoconf automake build-essential cmake dh-php7.0 libapache2-mod-php7.0 libass-dev libfreetype6-dev libmp3lame-dev libopus-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libx264-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev mercurial php7.0 php7.0-cgi php7.0-cli php7.0-common php7.0-curl php7.0-dev php7.0-exactimage php7.0-fpm php7.0-gd php7.0-geoip php7.0-imagick php7.0-imap php7.0-json php7.0-mcrypt php7.0-memcache php7.0-memcached php7.0-mongo php7.0-mysql php7.0-oauth php7.0-readline php7.0-sqlite php7.0-xcache php7.0-xmlrpc pkg-config texinfo yasm zlib1g-dev tree fdupes vlc-nox mpv  )
for j in "${PACKAGES[@]}"; do ff.apt.verify $j; done
echo -e "$Fok"


GET=$1; 
if [[ "$1" == "" ]]; then
echo -e -n "$Fstat domain? "
read GET
fi
			 								
#### GET										
### subdomain.example.com/abc/def
GETACTU=`echo $GET | tr '/' ' '`				
### subdomain.example.com abc def
GETRIM=`echo $GETACTU | awk '{print $1}'` 
### subdomain.example.com
CHECKDOM=`echo $GETRIM | rev | tr '.' ' '`  	
### moc example niamodbus
EXTRACT=`echo $CHECKDOM | awk '{ print $1"."$2 }'`  
### moc.elpmaxe
DOMAIN=` echo $EXTRACT | rev  | tr ' ' '.'` 	
### example.com
HOSTFET=`hostname -s ` 					      	
### UNIX to grab host name of this computer

ASKDOMAIN="$HOSTFET.$DOMAIN"					
### host.example.com
#### whatever user input is, we only focus on grabbing the domain only and use this host
#### name that it was orginally built with, and we use that name to go with domain name
#### otherwise this host wouldn't be able to connect to the WAN as host with public ip.
#### NOTE: this is kinda of overkill but, a bulletproof on getting domain on first script run.

goAndSetupSystem(){
	$SUDO ypdomainname --boot $DOMAIN
	echo -e "$Fwarn ypdomainname set for $DOMAIN"   			## UNIX command
	$SUDO nisdomainname --boot $DOMAIN 	 					## UNIX command
	echo -e "$Fwarn nisdomainname set for $DOMAIN"   			## UNIX command
	$SUDO sh -c "echo \"$ASKDOMAIN\" >> /etc/hostname"    	## UNIX writes new name to /etc/hostname
	echo -e "$Fwarn configuring /etc/hostname"
	echo -e "$Fok $ASKDOMAIN configured"					## output  as confirmed
}



echo -e -n "$Finfo proceed setting up as $ASKDOMAIN? (y/Y)"
GOAHEAD=""  											### filter <return> key or <space bar> out
while [[ "$GOAHEAD" != $"\x0a" && "$GOAHEAD" != $"\x20" ]]; do
    #read -s -N 1 GOAHEAD
    IFS= read -s -n 1 GOAHEAD							### grab user input but on one keystroke
 	echo -e "\n$Fstat your response: $GOAHEAD" 			### confirming user entered as yes
 	case "$GOAHEAD" in
 		y) goAndSetupSystem; break ;;					### if Y or y then fire the command and exit
		Y) goAndSetupSystem; break ;;
		*) echo -e "Fwarn exiting"; break;;
	esac
done

GATEWAYGET=`route -n | head -n 4 | tail -n 2 | head -n 1 | awk '{ print $2}'`
### gateway address  from UNIX route -n


GATEWAY=`route -n | head -n 4 | tail -n 2 | head -n 1 | awk '{ print $2}'`
D=`echo $GATEWAY | cut -d'.' -f4`
A=`echo $GATEWAY | cut -d'.' -f1`
B=`echo $GATEWAY | cut -d'.' -f2`
C=`echo $GATEWAY | cut -d'.' -f3`
SUBNET="$A.$B.$C"
CHOICE=""
if [[ "$CHOICE" == "" ]]; then
		echo -n "$Fstat Gateway: $GATEWAY and this host address: $SUBNET."
		read CHOICE
fi
HOSTIP="$SUBNET.$CHOICE"
echo -e "\n$Fwarn setting ip for $HOSTIP" 			### confirming user entered as yes
HOSTIFACE=`ff.net.iface`
HOSTIFACEMAC=`ff.net.iface-mac`
THISIP6=`ff.net.ip6`

$SUDO sh -c "echo \"option rfc3442-classless-static-routes code 121 = array of unsigned integer 8;
send host-name = gethostname();
request subnet-mask, broadcast-address, time-offset, routers,
	domain-name, domain-name-servers, domain-search, host-name,
	dhcp6.name-servers, dhcp6.domain-search, dhcp6.fqdn, dhcp6.sntp-servers,
	netbios-name-servers, netbios-scope, interface-mtu,
	rfc3442-classless-static-routes, ntp-servers;
timeout 300;

send dhcp-client-identifier $HOSTIFACEMAC;
send dhcp-lease-time 86400;
supersede domain-name \"$DOMAIN\";
prepend domain-name-servers 127.0.0.1,$GATEWAYGET,64.140.118.115,64.140.112.13,64.140.114.21,64.140.114.22,8.8.8.8;

script \"/sbin/dhclient-script\";

lease {
 interface \"$HOSTIFACE\";
 supersede domain-name \"$DOMAIN\"
 fixed-address $HOSTIP;
 option host-name \"$ASKDOMAIN\";
 option subnet-mask 255.255.255.0;
 option broadcast-address $SUBNET.255;
 option routers $GATEWAYGET;
 option domain-name-servers 127.0.0.1,$GATEWAY,64.140.118.115,64.140.112.13,64.140.114.21,64.140.114.22,8.8.8.8;
}

\" > /etc/dhcp/dhclient.conf"
echo "$Fwarn new /etc/dhcp/dhclient.conf configured"
$SUDO sh -c "echo \"source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto $HOSTIFACE
iface $HOSTIFACE inet static
	address $HOSTIP
	network	$SUBNET.0
	netmask 255.255.255.0
	gateway $GATEWAY
	broadcast $SUBNET.255

iface $HOSTIFACE inet6 manual
	pre-up /sbin/modprobe -q ipv6 ; /bin/true
	netmask 64
	address $THISIP6
	gateway 2001:470:1c:820:212:3fff:fe81:4d71

\" > /etc/network/interfaces"
echo "$Fwarn new /etc/network/interfaces configured"

$SUDO sh -c "echo \"net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
net.ipv6.conf.all.send_redirects=1
net.ipv4.conf.all.accept_redirects=1
net.ipv4.conf.all.send_redirects=1
net.ipv4.conf.all.secure_redirects=0
net.ipv6.conf.all.accept_redirects=1
net.ipv4.conf.all.rp_filter=0
kernel.domainname=faron.ca
net.ipv6.conf.all.secure_redirects=0
net.ipv4.tcp_syncookies=1
net.ipv4.conf.all.accept_source_route=1
net.ipv6.conf.all.accept_source_route=1
net.ipv4.conf.default.rp_filter=0
net.ipv4.conf.all.log_martians=1
\" > /etc/sysctl.conf"
echo "$Fwarn new /etc/sysctl.conf configured"
$SUDO sed -i -e '/faron/d' /etc/sudoers
$SUDO sed -i -e '/User privilege/a faron  ALL=(ALL:ALL) ALL' /etc/sudoers
echo "$Fwarn Securing sudo role for superadmin: $USER"
$SUDO sed -i -e 's/home\/faron/home\/users\/faron/g' /etc/passwd
echo "$Fwarn /home/$USER --> /home/users/$USER"
 $SUDO systemctl disable apparmor
 $SUDO systemctl enable apache2
 $SUDO mysql_secure_installation
 rm $PWD/ff.new.start.sh 2> /dev/null
 /usr/local/bin/ff.apt.update
# $SUDO reboot
#echo "$Fwarn rebooting"

exit 0