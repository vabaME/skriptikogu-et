#!/bin/bash

echo "Kas soovite saata teksti või faili? (t/f)"
read choice

if [ "$choice" == "t" ]; then
  echo "Sisestage tekst, mida soovite saata:"
  read text
  echo "$text" | nc termbin.com 9999
  echo "Tekst on edukalt saadetud!"
elif [ "$choice" == "f" ]; then
  echo "Sisestage faili täpne tee, mida soovite saata:"
  read file_path
  cat "$file_path" | nc termbin.com 9999
  echo "Fail on edukalt saadetud!"
else
  echo "Vale valik, proovige uuesti."
fi

