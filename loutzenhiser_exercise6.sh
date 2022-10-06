#loutzenhiser_exercise6.sh
#Isaac Loutzenhiser

#PartOne

cat $1 | grep -E "(female|male)" | cut -d , -f 1,2 | sed -E s'/,/ /g' | sort -u -t ' ' -k1,1 -k2,2 >gender-yearsExperience.txt

#PartTwo

cat $1 | grep -E "(female|male)" | cut -d , -f 1,2,4 | sed -E s'/,/ /g' | sort -t ' ' -k3n | tail -n 1

cat $1 | grep -E "(female|man)" | cut -d , -f 1,2,4 | sed -E s'/,/ /g' | sort -t ' ' -k3n | head -n 1 

cat $1 | grep -E "(female)" | cut -d , -f 1,2,4 | sed -E s'/,/ /g' | sort -t ' ' -k3n | tail -n 10

#PartThree

college=$ cat $1 | cut -d , -f 3,4 | sed -E s'/,/ /g' | grep -E "16 " | cut -d ' '  -f 2 | sort -n | head -n 1 

nocollege=$ cat $1 | cut -d , f 3,4 | sed -E s'/,/ /g' | grep -E "12 " | cut -d ' ' -f 2 | sort -n | head -n 1 

