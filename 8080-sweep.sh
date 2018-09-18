#!/bin/sh
for each in $(cat internal-targets.list);
	do /root/toolz/masscan/bin/masscan --rate 1000 -e eth1 -p8080 -oG outfile --range $each;
	done;

cat outfile |cut -d ' ' -f2 | grep -vi m | grep -vi p >> listening-8080-hosts.txt;
echo ">>cat listening-8080-hosts.txt"
cat listening-8080-hosts.txt


