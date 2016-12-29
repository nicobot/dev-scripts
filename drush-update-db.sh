#!/bin/bash
if [ $# -eq 0 ]
  then
    echo ""
    echo "Please indicate the drush alias origin and destination. e.g @site.dev @site.local"
    echo ""
    exit 1
fi

read -p "Are you sure to delete DB data and update? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

drush sql-drop -y
drush sql-sync $1 $2 -y && drush $2 cc all
notify "Database updated with server information" "Database updated"
