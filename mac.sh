#!/usr/bin/bash

echo "[+] Getting set up"

cd ~/Desktop/hashcat
wget https://github.com/NSAKEY/nsa-rules/raw/master/_NSAKEY.v2.dive.rule -o _NSAKEY.v2.dive.rule
head -n 128 _NSAKEY.v2.dive.rule > nsa128.rule
head -n 500 _NSAKEY.v2.dive.rule > nsa500.rule
echo "\$2 \$0 \$1 \$9" >> nsa128.rule
echo "\$2 \$0 \$1 \$9" >> nsa500.rule
echo "^9 ^1 ^0 ^2" >> nsa128.rule
echo "^9 ^1 ^0 ^2" >> nsa500.rule
echo "[+] Created Hashcat rulesets"

wget "https://hashes.org/download.php?type=found&hashlistId=515" -o 515_have-i-been-pwned-v2_found.txt
cat 515_have-i-been-pwned-v2_found.txt | grep -v fbobh_ > 515_have-i-been-pwned-v2_found_real.txt
echo "[+] Created Hashcat wordlists"

echo ""
hostname
ifconfig en8 | grep 'inet ' | cut -d ' ' -f 2
ifconfig en8 | grep 'ether ' | cut -d ' ' -f 2
