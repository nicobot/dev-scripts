#!/bin/bash

drush $1 ssh git pull && drush $1 ssh drush cc all
notify "Server updated" "Refresh server code"
