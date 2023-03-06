#!/bin/bash

# Kontrollime, kas skriptile on antud üks argument - sisendfaili nimi
if [ $# -ne 1 ]; then
  echo "Kasutamine: $0 sisendfail"
  exit 1
fi

# Loeme sisendfaili nime muutujasse
sisendfail=$1

# Määrame väljundfaili nime - lisame .ogg laiendi
valjundfail=${sisendfail%.*}.ogg

# Määrame keele ja häälemooduli valikud espeakile
keel="et"
haal="mb-lt-1"

# Eemaldame tühikud ja reavahetused sisendfailist, asendades need tühikutega
sisend=$(cat $sisendfail | tr -d '\n' | tr -s ' ')

# Kasutame espeaki, et lugeda tekst sisse ja salvestada väljundfail
espeak -v $keel+$haal -s 130 -w $valjundfail "$sisend"

# Kontrollime, kas väljundfail loodi edukalt
if [ $? -eq 0 ]; then
  echo "Väljundfail loodi: $valjundfail"
else
  echo "Väljundfaili loomine ebaõnnestus."
fi

