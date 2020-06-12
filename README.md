# Docker

Docker container for ]project-open[ 5.x.

**Remove any existing .sql file from the database directory if you have your own**

**Probably obvious, but you do need to have docker engine running in the context you are going to deploy this to. Try docker desktop if in doubt**

Steps to install

1. Ensure that your ports are open (8000 for the website and 5432 for Database). Change otherwise in docker-compose.yml

2. Run docker-compose
> docker-compose up -d

This will automatically install the demo data from ]project-open[ and open the site on localhost:8000 (or whatever port you chose)

Login with the E-Mail "sysadmin@tigerpond.com" and password "system". Then follow the System Configuration Wizard.

You can shutdown the server with
> docker-compose down

You can remove all data and start fresh with
> docker-compose down -v

You can restart the webserver with 
> docker-compose restart naviserver

If you are interested in further support, migrating this to a cloud based production environment or only want to shout out thanks, feel free to contact me at malte.sussdorff@cognovis.de

