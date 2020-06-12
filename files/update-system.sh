#!/bin/bash

# This code allows you to auto update a database from a remote server
# And bring it to live in your docker environment. Highly useful for
# Automated staging environments.

# Run the remote database commands to get the database
ssh <remoteServer> 'pg_dump -f <yourdump>.sql && gzip -f -9 <yourdump>.sql'
rm -f ./database/*.sql
scp -q intranet-prod:~/<yourdump>.sql.gz ./database
gunzip -f database/<yourdump>.sql.gz

# Shut down and remove volumes (especially the database!)
docker-compose down -v

# Start things up again. Should work automatically
# As the docker-compose file has the DB configured

docker-compose up -d