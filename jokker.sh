#!/bin/bash

for i in {1..7} 
do
  for j in {1..7} 
  do
    rand=$(shuf -i 0-9 -n 1)
    echo -n "$rand "
  done
  echo ""
done

