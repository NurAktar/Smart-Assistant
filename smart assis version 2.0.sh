#!/bin/sh
s=1
a=41
b=31
c=41
##

pip install gtts
#pacman -S mpg123
apt-get install mpg123


##
##<<'skip'

while [ $s -lt 13 ]
do
sleep 0.03
	echo -e "\e[$a"m"           Smart Assistant by Nur Aktar \e[$b"m" $RANDOM$RANDOM$RANDOM$RANDOM   \e[46m     \e[43m   \e[0m"
	s=`expr $s + 1`
if [ $s -eq 13 ]
	then
	s=1
	a=`expr $a + 1`
	b=`expr $b + 1`
	c=`expr $c + 1`

fi
if [ $b -eq 37 ]
	then
	 break
fi
done

echo -e "\e[0m"
clear

# if assis exist then in or make then in ///
if [ -d assis ]
	then
	 cd assis
else
	mkdir assis
	cd assis
fi

echo -e "\e[6;42m Y O U_ A R E_ R E A D Y_ T O_ G O \e[0m"
gtts-cli 'nice to see you again. i am online and at your service.here we go again!' --output s.mp3; mpg123 -q s.mp3;

#skip

clear
echo -e "\e[0;1;36m Hello sir! Ask me something. \e[0;5;31m[Type quit to Exit]\e[0;1;33m"
gtts-cli 'How can i help you? Sir?' --output gts.mp3; mpg123 -q gts.mp3;

while [ 1 ]
do
clear
echo -e "\e[0;1;36m Hello sir! Ask me something. \e[0;5;31m[Type quit to Exit]\e[0;1;33m"
echo -n "=>"
read val;

if [ $val == quit ]
	then
clear
	 echo -e "\e[0;1;41m  G O O D_ B Y E_"
	 echo -e "\e[0;1;41m      :)"
gtts-cli 'good bye! see you never again!' --output g.mp3; mpg123 -q g.mp3 
	 break
fi
clear

if [ -f $val ];
	then
	  echo -e "\e[0m\e[1;41mMatch Found!!\e[0m"
	  echo -e "\e[1;3;96m$val\e[0;1;92m is a \e[1;3;96m$(cat $val)\e[0m.\e[6;34m"
gtts-cli "$val is a $(cat $val)" --output $val.mp3; mpg123 -q $val.mp3


	read -s -p "Enter to continue."
else

	  echo -e "What is it sir?? \e[0;5;31m [Type cancel to Skip] \e[0;3;33m"
	gtts-cli 'what is it sir?' --output it.mp3 ; mpg123 -q it.mp3
	echo -n "=>"
	read que
if [ $que == cancel ]
then
continue
fi
	 echo "$que" > "$val"
	 echo ok
fi

done
