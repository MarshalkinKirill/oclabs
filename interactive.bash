#!/bin/bash

Menu(){
echo "<------Menu------>"
echo "a)calc"
echo "b)search"
echo "c)reverse"
echo "d)strlen"
echo "e)log"
echo "f)help"
echo "g)exit"
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
		bash ./calc.bash $fun $d1 $d2
	;;
	b)
		echo "Enter the directory"
		read dir
		echo "Enter the excaption"
		read exc
		bash ./search.bash $dir $exc
	;;
	c)
		echo "Enter the first file"
		read f1
		echo "enter the second file"
		read f2
		bash ./reverse $f1 $f2
	;;
	d)
		echo "Enter the string"
		read str
		bash ./strlen.bash $str
	;;
	e)
		bash ./log.bash
	;;
	f)
		bash ./help.bash
	;;
	g)
		echo "Enter exit code"
		read x
		bash ./ex.bash $x
		return
	;;
esac
Menu
}
Menu
