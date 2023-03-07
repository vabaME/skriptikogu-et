#!/bin/bash

words=("koer" "kass" "hobune" "jänes")
word=${words[$RANDOM % ${#words[@]}]}
word=${word##*( )}
word=${word%%*( )}

guessed=""
guesses=0
limit=6

# Funktsioon, mis ootab 10 sekundit
function wait_10_seconds {
    sleep 10
}

# Käivitame funktsiooni taustal, et oodata 10 sekundit
wait_10_seconds &

while true; do
    if [[ $guesses -ge $limit ]]; then
        echo "Ei õnnestunud sõna arvata! Mäng läbi!"
        break
    fi

    if [[ "$hidden" == "$word" ]]; then
        echo "Tubli, arvasid ära sõna!"
        break
    fi

    echo "Sisesta täht: "
    read -t 10 input

    if [ -z "$input" ]; then
        echo "Aeg läbi! Mäng läbi!"
        break
    fi

    # kontrollime, kas sisestatud väärtus on täht
    if [[ "$input" =~ [a-zA-Z] ]]; then
        letter=$input
        if [[ "$guessed" == *"$letter"* ]]; then
            echo "Seda tähte oled juba pakkunud!"
        elif [[ "$word" == *"$letter"* ]]; then
            echo "Õige! Täht $letter on sõnas."
            guessed="$guessed$letter"
        else
            echo "Vale! Täht $letter ei ole sõnas."
            guesses=$((guesses+1))
        fi
    else
        if [[ "$input" == "$word" ]]; then
            echo "Tubli, arvasid ära sõna!"
            break
        else
            echo "Vale! See ei ole õige sõna."
            guesses=$((guesses+1))
        fi
    fi

    hidden=$(echo "$word" | sed "s/[^$guessed ]/_/g")

    echo "Arva sõna (${#word} tähte)"

done

