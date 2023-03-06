#!/bin/bash

# Loome muutujad südamete ja valede arvutamiseks
hearts=0
mistakes=0

# Genereerime suvalise numbri vahemikus 1-10
number=$((1 + RANDOM % 10))

# Funktsioon, mis kontrollib, kas antud arv on õige või vale
check_guess() {
    if [[ $1 -eq $number ]]; then
        echo "❤️ Õige! Süda on peidus numbri $number taga."
        hearts=$((hearts + 1))
        return 0
    else
        echo "❌ Vale! Süda ei peitunud numbri $1 taga."
        mistakes=$((mistakes + 1))
        return 1
    fi
}

# Mängu käivitamine
echo "Tere tulemast südame otsimise mängu!"
echo "Süda on peidus ühe numbri taga vahemikus 1-10."
echo "Sul on 3 võimalust südame leidmiseks."
echo

# Alustame mängu
while [[ $mistakes -lt 3 ]]; do
    read -p "Palun arva ära, millise numbri taga süda peidus on: " guess
    check_guess $guess
    echo
    if [[ $hearts -eq 1 ]]; then
        echo "Oled leidnud ühe südame ❤️"
    elif [[ $hearts -eq 2 ]]; then
        echo "Tubli, oled leidnud juba kaks südant! ❤️❤️"
    elif [[ $hearts -eq 3 ]]; then
        echo "Vau, oled leidnud kõik kolm südant! ❤️❤️❤️"
        break
    fi
done

# Mäng on lõppenud
echo
echo "Mäng on läbi."
if [[ $hearts -eq 3 ]]; then
    echo "Sa võitsid!"
else
    echo "Sa kaotasid. Süda peitus numbri $number taga."
fi

