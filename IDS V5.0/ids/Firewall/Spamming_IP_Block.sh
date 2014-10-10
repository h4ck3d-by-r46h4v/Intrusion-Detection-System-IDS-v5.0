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

FILE="/tmp/drop.lasso"
URL="http://www.spamhaus.org/drop/drop.lasso"
echo 
echo -n "Applying DROP list to existing firewall..."
[ -f $FILE ] && /bin/rm -f $FILE || :
cd /tmp
wget $URL
blocks=$(cat $FILE  | egrep -v '^;' | awk '{ print $1}')
iptables -N droplist
for ipblock in $blocks
do
 iptables -A droplist -s $ipblock -j LOG --log-prefix "DROP List Block"
 iptables -A droplist -s $ipblock -j DROP
done
iptables -I INPUT -j droplist
iptables -I OUTPUT -j droplist
iptables -I FORWARD -j droplist
echo "...Done"

