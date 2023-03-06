#!/bin/bash

score=0
mistakes=0

while [ $mistakes -lt 10 ]
do
  num1=$((RANDOM % 100))
  num2=$((RANDOM % 100))
  op=$((RANDOM % 4))

  case $op in
    0) # addition
      sign="+"
      result=$((num1 + num2))
      ;;
    1) # subtraction
      sign="-"
      result=$((num1 - num2))
      ;;
    2) # multiplication
      sign="*"
      result=$((num1 * num2))
      ;;
    3) # division
      sign="/"
      result=$((num1 / num2))
      ;;
  esac

  read -p "$num1 $sign $num2 = " answer

  if [ $answer -eq $result ]; then
    echo "Õige!"
    score=$((score + 1))
  else
    echo "Vale! Õige on $result."
    mistakes=$((mistakes + 1))
  fi

  echo "Skoor: $score "

done

echo "Kõik on läbi! Liiga palju vigu. Lõpuskoor: $score "

