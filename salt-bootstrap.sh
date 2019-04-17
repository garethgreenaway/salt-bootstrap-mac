#!/bin/sh

echo "Downloading MD5"
curl https://repo.saltstack.com/osx/salt-2018.3.2-py2-x86_64.pkg.md5 > /tmp/salt-2018.3.2-py2-x86_64.pkg.md5

echo "Downloading Salt Package"
curl https://repo.saltstack.com/osx/salt-2018.3.2-py2-x86_64.pkg > /tmp/salt-2018.3.2-py2-x86_64.pkg

set `cat /tmp/salt-2018.3.2-py2-x86_64.pkg.md5` ; echo $1 | perl -ne "print lc"

md5 -q /tmp/salt-2018.3.2-py2-x86_64.pkg

echo "Installing Salt Package"
sudo installer -pkg /tmp/salt-2018.3.2-py2-x86_64.pkg -target /

echo "Installing psutil"
source /etc/profile ; pip install psutil

sudo launchctl list

echo "Unloading Salt Minion"
sudo launchctl unload /Library/LaunchDaemons/com.saltstack.salt.minion.plist

echo "Loading Salt Minion"
sudo launchctl load /Library/LaunchDaemons/com.saltstack.salt.minion.plist

echo "Creating /Users/jenkins/.bashrc"
echo "source /etc/profile" >> /Users/jenkins/.bashrc
