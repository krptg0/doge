FROM python:3.7-alpine 
RUN apk add alpine-sdk zlib-dev git libffi-dev musl-dev openssl-dev jpeg-dev && apk add nodejs --update-cache -X http://dl-3.alpinelinux.org/alpine/edge/main/ --allow-untrusted && rm -rf /node-10.4.2* /SHASUM256.txt /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts
COPY files/pip.txt pip.txt
RUN  pip3.7 install -r /pip.txt 
RUN git clone --depth=1 https://github.com/wowsuchdoge/doge /doge && git clone --depth=1 https://github.com/blawar/nut /doge/nut && apk del zlib-dev git alpine-sdk libffi-dev musl-dev openssl-dev
COPY files/nut.conf /doge/nut/conf/nut.conf
COPY files/doge.config.json /doge/doge.config.json
COPY files/start_doge.sh /start_doge.sh
COPY files/users.conf /doge/nut/conf/users.conf

ENTRYPOINT ["/bin/sh","start_doge.sh"]