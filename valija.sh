#!/bin/bash
# Defineerige väljundfaili nimi ja tee uus fail, kui seda pole olemas
valikute_fail=".valikud.txt"
touch "$valikute_fail"
# Defineerige nimede ja atribuutide muutujad
nimiA="1"
nimiB="2"
nimiC="3"
attribuutA="orav"
attribuutB="karu"
attribuutC="eesel200"
# Kuvage kõik võimalikud valikud koos nende atribuutidega
echo "Vali üks nendest nimedest: "
echo " - $nimiA ($attribuutA)"
echo " - $nimiB ($attribuutB)"
echo " - $nimiC ($attribuutC)"
# Küsige kasutajalt valikut ja salvestage see väljundfaili
read -p "Sisesta oma valik: " valik
echo "$valik" >> "$valikute_fail"
# Arvutage, kui palju iga nime kohta on valitud
valikud_a=$(grep -c "$nimiA" "$valikute_fail")
valikud_b=$(grep -c "$nimiB" "$valikute_fail")
valikud_c=$(grep -c "$nimiC" "$valikute_fail")
kokku=$(wc -l < "$valikute_fail")
# Kuvage kasutaja valik ja teade, kui palju iga nime kohta on valitud
if [ "$valik" == "$nimiA" ]; then
  echo "Sa valisid nime: $valik ($attribuutA)"
  echo "Tubli! Tegid õige valiku."
elif [ "$valik" == "$nimiB" ]; then
  echo "Sa valisid nime: $valik ($attribuutB)"
  echo "Tubli! Tegid õige valiku."
elif [ "$valik" == "$nimiC" ]; then
  echo "Sa valisid nime: $valik ($attribuutC)"
  echo "Tubli! Tegid õige valiku."
else
  echo "Viga: Teie valik oli vale ja on kehtetu."
fi
echo "Valitud korrad: $kokku"
echo "$nimiA: $valikud_a ($(echo "scale=2; $valikud_a/$kokku*100" | bc)%)"
echo "$nimiB: $valikud_b ($(echo "scale=2; $valikud_b/$kokku*100" | bc)%)"
echo "$nimiC: $valikud_c ($(echo "scale=2; $valikud_c/$kokku*100" | bc)%)"

