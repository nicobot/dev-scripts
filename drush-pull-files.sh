#!/bin/bash
# In this case the parameter should be only the main drush alias, like @ficosa 
drush $1 pull-files
notify "Pulled files done!" "Pulled files"
