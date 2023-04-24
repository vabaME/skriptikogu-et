#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Kasutus: $0 <otsitav sõna> <kataloog>"
  exit 1
fi

sona=$1
kataloog=$2

if [ ! -d $kataloog ]; then
  echo "Kataloogi $kataloog ei eksisteeri"
  exit 1
fi

# otsi sõna kõigist failidest kataloogis ja alamkataloogides
grep -r $sona $kataloog

exit 0

