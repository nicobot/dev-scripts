#!/bin/bash

ENV='dev'
SITE='15d65ddf-486b-4854-aee6-7edeed9590a4'

read -sp "Your Pantheon Password: " PASSWORD
if [[ -z "$PASSWORD" ]]; then
echo "Woops, need password"
exit
fi

while [ 1 ]
do
sshpass -p "$PASSWORD" rsync --partial -rlvz --size-only --ipv4 --progress -e 'ssh -p 2222'  $ENV.$SITE@appserver.$ENV.$SITE.drush.in:files/* --temp-dir=../tmp/  ./files/
if [ "$?" = "0" ] ; then
echo "rsync completed normally"
exit
else
echo "Rsync failure. Backing off and retrying..."
sleep 180
fi
done

notify "Drupal cache cleared-up" "Drupal cache refreshed!"
