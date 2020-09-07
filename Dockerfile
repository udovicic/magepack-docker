FROM alpine:3.11
LABEL maintainer="stjepan@udovicic.org"

RUN apk update && apk upgrade && apk add nodejs npm && PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1 npm install -g magepack@2.3.2 && mkdir -p /source
WORKDIR /source
CMD ["/usr/bin/magepack"]
