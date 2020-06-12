This folder contains packages which could overwrite existing packages in the container

You need to explicitly configure this though in the docker-compose.yml

## How to overwrite a package (or include a new one)

1) Put your package in "./packages/<yourpackage>" on your docker host (not image!)
2) Add the package folder in your docker-compose.yml (see the demo line for it)

Starting up your docker container for ]project-open[ will load with the "mounted" packages from ./packages instead of the one found in your container.