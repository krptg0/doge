#!/bin/sh
#Copy keys.txt to doge folder
if [ -e /keys/keys.txt ]; then
  cp /keys/keys.txt /doge/nut/keys.txt
else
  echo "--- YOU MUST PLACE KEYS.TXT IN THE /keys MOUNTPOINT ---"
  exit 1
fi
#Set variables
if [ -n "${NUT_USER}" ]; then
  sed -i -e 's/AdMiN/'${NUT_USER}'/g' /doge/doge.config.json
  sed -i -e 's/AdMiN/'${NUT_USER}'/g' /doge/nut/conf/users.conf
  echo "Nut user set to ${NUT_USER}"
fi

if [ -n "${NUT_PASSWD}" ]; then
  sed -i -e 's/nYsTIaNICHIm/'${NUT_PASSWD}'/g' /doge/doge.config.json
  sed -i -e 's/nYsTIaNICHIm/'${NUT_PASSWD}'/g' /doge/nut/conf/users.conf
  echo "Nut passwd set to ${NUT_PASSWD}"
fi

if [ -n "${DOGE_USER}" ]; then
  sed -i -e 's/doge/'${DOGE_USER}'/g' /doge/doge.config.json
  echo "Doge user set to ${DOGE_USER}"
fi

if [ -n "${DOGE_PASSWD}" ]; then
  sed -i -e 's/DOGE/'${DOGE_PASSWD}'/g' /doge/doge.config.json
  echo "Doge passwd set to ${DOGE_PASSWD}"
fi
cd /doge/server
node server.js
