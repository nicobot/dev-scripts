#!/bin/bash

drush $1 ssh git pull && drush $1 ssh drush cc all && drush $1 ssh drush features-revert-all -y && notify "Server updated" "Changes deployed"
