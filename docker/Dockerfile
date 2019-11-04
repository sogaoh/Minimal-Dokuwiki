FROM alpine:3

LABEL maintainer sogaoh 

ENV TIMEZONE		Asia/Tokyo
##ENV DW_VERSION 		2018-04-22b
#ENV COMMIT_HASH		1eb5227

RUN apk --update add nginx php7 php7-fpm php7-opcache php7-session php7-json php7-pdo_sqlite php7-openssl curl supervisor && \
	apk add --update tzdata && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
	echo "${TIMEZONE}" > /etc/timezone 

COPY ./docker/nginx-default.conf /etc/nginx/conf.d/default.conf

##RUN wget -O /tmp/dokuwiki.tgz https://download.dokuwiki.org/src/dokuwiki/dokuwiki-${DW_VERSION}.tgz
##RUN cd / && tar xzf /tmp/dokuwiki.tgz && mv dokuwiki-${DW_VERSION} dokuwiki && rm -f /tmp/dokuwiki.tgz
#RUN wget -O /tmp/dokuwiki.tgz http://github.com/splitbrain/dokuwiki/tarball/master
#RUN cd / && tar xzf /tmp/dokuwiki.tgz && mv splitbrain-dokuwiki-${COMMIT_HASH} dokuwiki && rm -f /tmp/dokuwiki.tgz
COPY ./server/dokuwiki /dokuwiki

RUN sed -i 's#user = nobody#user = nginx#' /etc/php7/php-fpm.d/www.conf && \
	sed -i 's#group = nobody#group = nginx#' /etc/php7/php-fpm.d/www.conf && \
	mkdir /run/nginx/ && \
	chown -R nginx:nginx /dokuwiki

RUN apk del tzdata && \
	rm -rf /var/cache/apk/*

EXPOSE 80
#VOLUME  /dokuwiki
WORKDIR /dokuwiki

COPY ./docker/supervisord.conf /etc

CMD ["/usr/bin/supervisord"]

