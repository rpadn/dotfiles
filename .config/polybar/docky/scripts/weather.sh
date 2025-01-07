#!/usr/bin/bash

# format-prefix does not work as expected when specified in polybar. 
# We return it as part of the script output
echo "$(curl -sS 'https.wttr.in/Porto?format=3')"
