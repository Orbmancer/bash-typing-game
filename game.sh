#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

score=0
maxScore=0

echo "Get ready ! Type fast and accurate ;)"
echo "Starting in 3 ..."
#sleep 1
echo "2 ..."
#sleep 1
echo "1 ..."
#sleep 1
echo "${green}Let's roll !${reset}"

words=(bash type game)

for word in "${words[@]}"; do
	#word=${words[wordIndex]}

	echo "Next word: ${word}"

	for i in `seq 0 $(( ${#word} -1 ))`; do
		read -n 1 -s char

		wordChar="${word:$i:1}"
		((maxScore++))

		if [ "$char" == $wordChar ]; then
			printf "${green}${wordChar}${reset}"
			((score++))
		else
			printf "${red}${wordChar}${reset}"
		fi
	done

	echo ""
done

echo "Finished !"
echo "Score: (${score}/${maxScore})"

function clearLine {
	echo "\e[1A"
}
