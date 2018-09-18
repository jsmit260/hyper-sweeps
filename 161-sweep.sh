#!/bin/sh
for each in $(cat ALIVE/alive-hosts.txt);
	do /root/toolz/masscan/bin/masscan --rate 1000 -e eth1 -p161 -oG outfile --range $each;
	done;

cat outfile |cut -d ' ' -f2 | grep -vi m | grep -vi p >> listening-161-hosts.txt;
echo ">>cat listening-161-hosts.txt"
cat listening-161-hosts.txt


