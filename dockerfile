FROM postgres:alpine

RUN apk update -U \
	&& apk add --no-cache pgbouncer \
	&& rm -rf /var/cache/apk/* 

COPY pgbouncer.ini.template /tmp/
COPY userlist.txt.template /tmp/

ADD entrypoint.sh ./
EXPOSE 5432
CMD ["./entrypoint.sh"]



