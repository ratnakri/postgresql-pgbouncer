#!/bin/bash

chown -R pgbouncer.postgres /var/log/pgbouncer/pgbouncer.log

DIR="/etc/pgbouncer"

if [ "$(ls -A $DIR)" ]; then
	if ! [ -e "$DIR/pgbouncer.ini" ]; then
		
		exec cp /tmp/pgbouncer.ini.template $DIR/pgbouncer.ini
		
	fi

	if ! [ -e "$DIR/userlist.txt" ]; then

		exec cp /tmp/userlist.txt.template $DIR/userlist.txt

	fi
else
	exec cp /tmp/pgbouncer.ini.template $DIR/pgbouncer.ini \
	&& cp /tmp/userlist.txt.template $DIR/userlist.txt
fi

pgbouncer -d -U postgres /etc/pgbouncer/pgbouncer.ini
