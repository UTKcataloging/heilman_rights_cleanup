#!/bin/bash
 
FH=$FEDORA_HOME
HOST="digital.lib.utk.edu/collections"
PROT="http"
PIDS="heilman.txt"


cat $PIDS | while read line; do
  curl "$PROT://$HOST/islandora/object/$line/datastream/MODS" > "../modsxml/$line.xml"
  done 
