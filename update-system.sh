#!/bin/bash

# Update the repository
for pkg in `ls -d packages/*`; do
    cd $pkg
    git checkout master >>/dev/null 2>&1
    git pull origin master
    cd ../..
done

# Run the remote database commands to get the database
ssh intranet 'pg_dump  --no-owner -f intranet.sql && gzip -f -9 intranet.sql'
rm ./database/*

scp -q intranet:~/intranet.sql.gz ./database
gunzip -f database/intranet.sql.gz

# Shut down and remove volume
docker-compose down -v

# Start things up again. Should work automatically
# As the docker-compose file has the DB configured

docker-compose up -d

sleep 20

docker container restart intranet_naviserver_1
docker cp migrate.tcl intranet_naviserver_1:/var/www/projop/www/migrate.tcl

sleep 120

curl http://localhost:8080/migrate.tcl
docker exec intranet_naviserver_1 rm /var/www/projop/www/migrate.tcl