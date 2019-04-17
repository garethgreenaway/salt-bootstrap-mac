#!/bin/sh

curl https://repo.saltstack.com/osx/salt-2018.3.2-py2-x86_64.pkg.md5 > /tmp/salt-2018.3.2-py2-x86_64.pkg.md5

curl https://repo.saltstack.com/osx/salt-2018.3.2-py2-x86_64.pkg > /tmp/salt-2018.3.2-py2-x86_64.pkg

set `cat /tmp/salt-2018.3.2-py2-x86_64.pkg.md5` ; echo $1 | perl -ne "print lc"

md5 -q /tmp/salt-2018.3.2-py2-x86_64.pkg

sudo installer -pkg /tmp/salt-2018.3.2-py2-x86_64.pkg -target / ; exit 0

source /etc/profile ; pip install psutil

sudo launchctl list

sudo launchctl unload /Library/LaunchDaemons/com.saltstack.salt.minion.plist

sudo launchctl load /Library/LaunchDaemons/com.saltstack.salt.minion.plist

echo "export PATH=$PATH:/opt/salt/bin" >> ~/jenkins/.bashrc
