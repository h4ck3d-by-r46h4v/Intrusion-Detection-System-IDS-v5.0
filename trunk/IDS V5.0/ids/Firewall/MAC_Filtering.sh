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

echo "Enter option <1-5> to perform MAC Blocking "
echo
echo "1 = Manually Blocking MAC Address"
echo "2 = Manually Allowing MAC Address "
echo "3 = Manually Allowing SSH Access to Specific MAC Address "
echo "4 = Manually Denying SSH Access to Specific MAC Address "
echo "5 = Exit "
echo
read NUM
if [ "$NUM" -eq 1 ]; then 
echo "You Have Choosen Manually Blocking Of MAC Address : "
echo
echo "Enter The MAC Address you want to block : "
read mac
iptables -A INPUT -m mac --mac-source $mac -j DROP
iptables -A FORWARD -m mac --mac-source $mac -j DROP
echo "[+] MAC Address Blocked successfully "
elif [ "$NUM" -eq 2 ]; then
echo "You Have choosen Manually Allowing Of MAC Address :"
echo
echo "Enter The MAC Address you want to Allow : "
read al
iptables -I INPUT -m mac --mac-source $al -j ACCEPT
echo "[+] MAC Address Allow successfully "
elif [ "$NUM" -eq 3 ]; then
echo "You Have choosen Manually Allowing SSH Access to Specific MAC Address :"
echo
echo "Enter The MAC Address you want to Allow : "
read qw
iptables -I INPUT -p tcp --dport 22 -m mac --mac-source $qw -j ACCEPT
echo "[+] MAC Address Allow successfully "
elif [ "$NUM" -eq 4 ]; then
echo "You Have choosen Manually Denying SSH Access to Specific MAC Address :"
echo
echo "Enter The MAC Address you want to Block : "
read we
iptables -I INPUT -p tcp --dport 22 -m mac --mac-source $we -j REJECT
echo "[+] MAC Address Blocked successfully "
elif [ "$NUM" -eq 4 ]; then
echo " Bye Bye "
exit 0
else
echo "Wrong Option Selected"
echo " Bye Bye "
exit 0
fi
