#!/bin/bash

Menu(){
echo "<------Menu------>"
echo "1)calc"
echo "2)search"
echo "3)reverse"
echo "4)strlen"
echo "5)log"
echo "6)help"
echo "7)exit"
echo "<---------------->"
echo "Choose command designation to start"
read des

case "$des" in
	a)
		echo "Choose function sum, sub, mul, div"
		read fun
		echo "Enter first digit"
		read d1
		echo "Enter second digit"
		read d2
		bash /root/oclab1/calc.bash $fun $d1 $d2
	;;
	b)
		echo "Enter the directory"
		read dir
		echo "Enter the excaption"
		read exc
		bash /root/oclab1/search.bash $dir $exc
	;;
	c)
		echo "Enter the first file"
		read f1
		echo "enter the second file"
		read f2
		bash /root/oclab1/reverse $f1 $f2
	;;
	d)
		echo "Enter the string"
		read str
		bash /root/oclab1/strlen.bash $str
	;;
	e)
		bash /root/oclab1/log.bash
	;;
	f)
		bash /root/oclab1/help.bash
	;;
	d)
		exit 0
	;;
esac
Menu
}
Menu
