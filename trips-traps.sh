#!/bin/bash

declare -a laud=(" " " " " " " " " " " " " " " " " ")

function prindi_laud {
    echo " ${laud[0]} | ${laud[1]} | ${laud[2]} "
    echo "---+---+---"
    echo " ${laud[3]} | ${laud[4]} | ${laud[5]} "
    echo "---+---+---"
    echo " ${laud[6]} | ${laud[7]} | ${laud[8]} "
}

function kontrolli_voitu {
    if [[ "${laud[$1]}" == "$2" && "${laud[$3]}" == "$2" && "${laud[$5]}" == "$2" ]]; then
        echo "$2 võitis!"
        exit 0
    fi
}

function kontrolli_viiki {
    for i in {0..8}; do
        if [[ "${laud[$i]}" == " " ]]; then
            return
        fi
    done
    echo "Viik!"
    exit 0
}

mangija="X"
while true; do
    prindi_laud
    read -p "Mängija $mangija, sisesta positsioon (1-9): " positsioon
    if [[ "${laud[$positsioon-1]}" != " " ]]; then
        echo "Positsioon on juba võetud, proovi uuesti."
        continue
    fi
    laud[$positsioon-1]=$mangija
    kontrolli_voitu 0 $mangija 1 $mangija 2 $mangija
    kontrolli_voitu 3 $mangija 4 $mangija 5 $mangija
    kontrolli_voitu 6 $mangija 7 $mangija 8 $mangija
    kontrolli_voitu 0 $mangija 3 $mangija 6 $mangija
    kontrolli_voitu 1 $mangija 4 $mangija 7 $mangija
    kontrolli_voitu 2 $mangija 5 $mangija 8 $mangija
    kontrolli_voitu 0 $mangija 4 $mangija 8 $mangija
    kontrolli_voitu 2 $mangija 4 $mangija 6 $mangija
    kontrolli_viiki
    if [[ "$mangija" == "X" ]]; then
        mangija="O"
    else
        mangija="X"
    fi
done

