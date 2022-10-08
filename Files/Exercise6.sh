
# Will write  file that contains gender in first column and yearsExperience in second column dilimited by a space. Rows sorted by gender and then by yearsExperience. Keep pairings in rows intact.
# Usage: bash Exercise6.sh

echo "gender yearsExperience wage of highest earner"
cat wages.csv | tail -n +2 | cut -d, -f 1,2,4 | sort -t, -nk3 | tail -n 1

echo "gender yearsExperience wage of lowest earner"
cat wages.csv | tail -n +2 | cut -d, -f 1,2,4 | sort -t, -nk3 | head -n 1 

echo "number of females in top 10 wage earners"
cat wages.csv | tail -n +2 | sort -t, -rnk4 | head -n 10 | grep "female" -c
