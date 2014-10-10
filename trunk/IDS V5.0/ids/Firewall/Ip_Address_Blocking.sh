#!/bin/bash

#    This file is part of Intrusion Detection System By - Raghav Bisht.
#
#    Intrusion Detection System By - Raghav Bisht is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Intrusion Detection System By - Raghav Bisht is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>

echo "Enter option <1-3> to perform IP Blocking "
echo
echo "1 = Manually Blocking"
echo "2 = Manually Allowing "
echo "3 = Exit "
echo
read NUM
if [ "$NUM" -eq 1 ]; then 
echo "You Have Choosen Manually Blocking Of IP : "
echo
echo "Enter The Ip Address you want to block : "
read ip
iptables -A INPUT -s $ip -j DROP
iptables -A INPUT -s $ip -p tcp --destination-port 80 -j DROP
iptables -A INPUT -s $ip -p tcp --destination-port 443 -j DROP
sudo ufw deny from $ip 
echo "[+] Ip blocked successfully "
elif [ "$NUM" -eq 2 ]; then
echo "You Have choosen Manually Allowing Of IP :"
echo
echo "Enter The Ip Address you want to Allow : "
read al
iptables -D INPUT -s $al -j DROP
sudo ufw allow from $al
elif [ "$NUM" -eq 3 ]; then
echo " Bye Bye "
exit 0
else
echo "Wrong Option Selected"
echo " Bye Bye "
exit 0
fi
