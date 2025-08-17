#!/bin/bash

sum=0

while true; do
    read -p "Enter a number (0 to stop): " num

    if [[ $num -eq 0 ]]; then
        break
    fi

    if [[ $num -gt 0 ]]; then
        sum=$((sum + num))
    fi
done

echo "Sum of positive numbers: $sum"
