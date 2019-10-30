#FROM alpine:3.8
FROM centos:7.5.1804
MAINTAINER heidai
LABEL name="mm-wiki" 
COPY  mm-wiki-linux-amd64.tar.gz /
COPY  docker-entrypoint.sh /bin/
RUN set -ex; \
	chmod a+x /bin/docker-entrypoint.sh; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime; \
	echo $TZ > /etc/timezone
VOLUME /data  /mm-wiki
EXPOSE 8080
WORKDIR /mm-wiki
ENTRYPOINT docker-entrypoint.sh