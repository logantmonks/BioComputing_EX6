# A shell script that takes the input wages.csv and accomplishes the three tasks
# outlined in the assignment
# Usage: bash MARTIN_PETER_Exercise6.sh wages.csv

tail -n +2 "$1" | cut -d, -f 1,2 | tr ', ' ' ' | sort -t ' ' -k1,1 -k2,2nr > gender_YEsort.txt
