#!/bin/bash

# part 1
cat wages.csv | tail -n+2 | cut -d ',' -f 1,2 | sort -t ',' -k1,1 -k2,2n | uniq | sed 's/,/ /g' > output.txt

# part 2
echo "highest earner:"
cat wages.csv | tail -n+2 | sort -t ',' -k 4 -n | tail -n 1 | cut -d ',' -f 1,2,4
echo
echo "lowest earner:"
cat wages.csv | tail -n+2 | sort -t ',' -k 4 -n | head -n 1 | cut -d ',' -f 1,2,4
echo
echo "number of females in top ten earners:"
cat wages.csv | tail -n+2 | sort -t ',' -k 4 -n | tail -n 10 | grep female | wc -l

echo
# part 3
echo "effects of graduating college on min wage:"
college=$(cat wages.csv | tail -n+2 | grep .*,.*,16.* | cut -d ',' -f 4 | sort -n | head -n 1)
highschool=$(cat wages.csv | tail -n+2 | grep .*,.*,12.* | cut -d ',' -f 4 | sort -n | head -n 1)
echo $college - $highschool | bc
