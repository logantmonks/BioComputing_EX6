cat ../wages.csv | cut -f 1,2 -d "," | sed 's/,/ /' | grep [0-9] | sort -u | sort -k1,1 -k2,2n > uniquegenderworkexperience.txt

echo highest earner

cat ../wages.csv | cut -d"," -f1,2,4 | sort -t"," -k3n | grep [0-9] | tail -n1

echo lowest earner

cat ../wages.csv | cut -d"," -f1,2,4 | sort -t"," -k3n | grep [0-9] | head -n1

echo females in top ten earners

cat ../wages.csv | cut -d"," -f1,2,4 | sort -t"," -k3n | grep [0-9] | tail -n10 | grep female | wc -l 

no_college_min_wage=$(cat ../wages.csv | cut -d"," -f3,4 | sort -t"," -k1n | grep 12, | head -n1 | cut -d"," -f2)

yes_college_min_wage=$(cat ../wages.csv | cut -d"," -f3,4 | sort -t"," -k1n | grep 16, | head -n1 | cut -d"," -f2)

echo how much more is the minimum wage with college education

echo $yes_college_min_wage - $no_college_min_wage | bc
