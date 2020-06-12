#!/bin/bash
echo "Update STARTED:: " >./update-submodules.log
echo `date` >>./update-submodules.log
for pkg in `ls -d packages/*/`; do
	echo $pkg >> update-submodules.log
	cd $pkg
	git checkout master >>/dev/null 2>&1
	git pull origin master >>../../update-submodules.log 2>&1
    cd ../../
done
