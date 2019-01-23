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

if [ -n "${BASE_PATH}" ]; then
  sed -i -e 's/\/nsp\/{name}\[{id}\]\[v{version}\].nsp/\/nsp\/'${BASE_PATH}'{name}[{id}][v{version}].nsp/g'
  echo "BASE path set to /nsp/${BASE_PATH}"
fi


if [ -n "${UPDATE_PATH}" ]; then
  sed -i -e 's/\/nsp\/Updates\/{name}\[{id}\]\[v{version}\].nsp/\/nsp\/'${UPDATE_PATH}'{name}[{id}][v{version}].nsp/g'
  echo "UPDATE path set to /nsp/${UPDATE_PATH}"
fi

if [ -n "${DLC_PATH}" ]; then
  sed -i -e 's/\/nsp\/DLC\/{name}\[{id}\]\[v{version}\].nsp/\/nsp\/'${DLC_PATH}'{name}[{id}][v{version}].nsp/g'
  echo "DLC path set to /nsp/${DLC_PATH}"
fi

if [ -n "${NSX_PATH}" ]; then
  sed -i -e 's/\/nsp\/NSX\/{name}\[{id}\]\[v{version}\].nsp/\/nsp\/'${NSX_PATH}'{name}[{id}][v{version}].nsp/g'
  echo "NSX path set to /nsp/${NSX_PATH}"
fi

if [ -n "${TITLEDB}" ]; then
  sed -i -e 's/http:\/\/snip.li\/nutdb/'${TITLEDB}'/g'
  echo "TITLEDB URL set to ${TITLEDB}"
fi
cd /doge/server
node server.js
