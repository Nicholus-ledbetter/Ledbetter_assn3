#! /bin/bash

#create an array that contains 1 instance of every snake id

id=($(grep -v ID BTS_data.txt | sort -k1 | cut -f 1 | uniq))

#create a variable that defines the number of individual snakes
max=$(echo ${#id[@]})

#set index counter
COUNTER=0

#write a loop that will loop through every snake in the array and create a file with a header that only contains data for that snake

while [ $COUNTER -lt $max ]
do
        grep ID BTS_data.txt | column -t >file_${id[$COUNTER]}.txt
	grep -v ID BTS_data.txt | column -t | grep ${id[$COUNTER]}  >>file_${id[$COUNTER]}.txt
	let COUNTER=COUNTER+1
done

#celebrate
echo $(ls file* | wc -l) files were created!!!


