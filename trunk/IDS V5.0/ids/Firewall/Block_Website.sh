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

echo "Enter option <1-3> to perform to Block Website "
echo
echo "1 = Manually Blocking Website"
echo "2 = Manually Unblocking Website"
echo "3 = Exit "
echo "Enter :"
read NUM
if [ "$NUM" -eq 1 ]; then 
echo "You Have Choosen Manually Blocking Website : "
echo
echo "Enter The website name you want to block : "
read site
sudo sh -c 'echo "0.0.0.0 '$site'" >> /etc/hosts'
sudo sh -c 'echo "127.0.0.1 '$site'" >> /etc/hosts' 
echo "[+] Website blocked successfully "
elif [ "$NUM" -eq 2 ]; then
echo "You Have choosen Manually Unblocking Website :"
echo
gedit /etc/hosts
elif [ "$NUM" -eq 3 ]; then
echo " Bye Bye "
exit 0
else
echo "Wrong Option Selected"
echo " Bye Bye "
exit 0
fi
