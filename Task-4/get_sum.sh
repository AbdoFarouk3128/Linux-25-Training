is_positive(){
if [[ $1 -gt 0 ]]; then 
return 0
else 
return 1
fi
}

sum=0


while true; do
read -p "Enter a number (0 to stop): " num 
if [[ $num -eq 0 ]]; then
break
fi
if is_positive "$num"; then
sum=$((sum+num))
fi
done 
echo "Sum of positive numbers: $sum"
