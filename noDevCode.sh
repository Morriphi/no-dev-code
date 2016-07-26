#!/bin/bash

function checkFor {
  if [ $(grep -n -i $2 -r . --exclude-dir=node_modules | wc -l | sed 's/\s//g') -ne '0' ]
  then
    echo ' *********************************************'
    echo '***********************************************'
    echo '  ** You screwed up! You left in a ' $1 ' **'
    echo '***********************************************'
    echo ' *********************************************'
    grep -n -i $2 -r . --exclude-dir=node_modules
    exit 1
  fi
}

checkFor 'console.log', 'console.log('
checkFor '.only', '\(it\|describe\)\.only('
