#!/bin/sh

#original openvpn rules
#iptables -t filter -A INPUT -i eth0 -p udp -m udp --dport 1194 -j ACCEPT
#iptables -t filter -A INPUT -i tun0 -j ACCEPT
#iptables -t filter -A FORWARD -i tun0 -o eth0 -j ACCEPT
#iptables -t filter -A FORWARD -i eth0 -o tun0 -j ACCEPT
#iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

#port forwarding
#louine
#ssh
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 2255 -j DNAT --to-destination 10.8.0.2:22
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 22 -j ACCEPT
#ftp
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 21 -j DNAT --to-destination 10.8.0.2:21
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 21 -j ACCEPT
#smtp
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 25 -j DNAT --to-destination 10.8.0.2:25
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 25 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 587 -j DNAT --to-destination 10.8.0.2:587
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 587 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 465 -j DNAT --to-destination 10.8.0.2:465
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 465 -j ACCEPT
#imap
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 143 -j DNAT --to-destination 10.8.0.2:143
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 143 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 993 -j DNAT --to-destination 10.8.0.2:993
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 993 -j ACCEPT
#pop
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 110 -j DNAT --to-destination 10.8.0.2:110
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 110 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 995 -j DNAT --to-destination 10.8.0.2:995
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 995 -j ACCEPT
#http
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.8.0.2:80
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 443 -j DNAT --to-destination 10.8.0.2:443
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 443 -j ACCEPT
#dns
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 53 -j DNAT --to-destination 10.8.0.2:53
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 53 -j ACCEPT
#plesk
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 8443 -j DNAT --to-destination 10.8.0.2:8443
iptables -t filter -A INPUT -p tcp -d 10.8.0.2 --dport 8443 -j ACCEPT
