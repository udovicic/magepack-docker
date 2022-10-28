FROM node:14
LABEL maintainer="stjepan@udovicic.org"

RUN apt-get update \
	&& apt-get install -y wget gnupg ca-certificates \
	&& wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
	&& apt-get update \
	&& apt-get install -y google-chrome-stable chromium \
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apk/* /var/tmp/* /tmp/* \
	&& mkdir -p /source \
	&& npm install -g puppeteer --unsafe-perm=true --allow-root \
	&& npm install -g magepack@2.11.2 --unsafe-perm=true --allow-root

WORKDIR /source
CMD ["/usr/bin/magepack"]
