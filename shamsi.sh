#!/bin/bash
#a simple shamsi calendar
#made by amir mohammadi :)

#variables for date:
day=`date +%_d`
month=`date +%_m`
year=`date +%Y`
#KABISE YA NA
kabise=$[(year-1)%4]
#shamsi date variables
sDay=0
sMonth=0
smonthNumber=0
sYear=0
#check and convert month and day
Check(){
 case $month in
	1) sDay=$[day+10];
	 if [ $sDay -lt 31 ]; then
	  sMonth="Dey"
	  smonthNumber=10
	 else
	  sMonth="Bahman"
	  smonthNumber=11
	  sDay=$[sDay-30]
	 fi ;;
	 
	2) sDay=$[day+11];
	 if [ $sDay -lt 31 ]; then
	  sMonth="Bahman"
	  smonthNumber=11
	 else
	  sMonth="Esfand"
	  smonthNumber=12
	  sDay=$[sDay-29]
	 fi ;;
	 
	 3) sDay=$[day+9];
	 if [ $kabise -eq 3 ];then
	  if [ $sDay -lt 31 ]; then
	   sMonth="Esfand"
	   smonthNumber=12
	  else
	   sMonth="Farvardin"
	   smonthNumber=1
	   sDay=$[sDay-30]
	  fi ;
	 else
	  if [ $sDay -lt 30 ]; then
	   sMonth="Esfand"
	   smonthNumber=12
	  else
	   sMonth="Farvardin"
	   smonthNumber=1
	   sDay=$[sDay-29]
	  fi ;
	 fi;;
	 
	 
	 4) sDay=$[day+11];
	 if [ $sDay -lt 32 ]; then
	  sMonth="Farvardin"
	  smonthNumber=1
	 else
	  sMonth="Ordibehesht"
	  smonthNumber=2
	  sDay=$[sDay-31]
	 fi ;;
	 
	 5) sDay=$[day+10];
	 if [ $sDay -lt 32 ]; then
	  sMonth="Ordibehesht"
	  smonthNumber=2
	 else
	  sMonth="Khordad"
	  smonthNumber=3
	  sDay=$[sDay-31]
	 fi ;;
	 
	 6) sDay=$[day+10];
	 if [ $sDay -lt 32 ]; then
	  sMonth="Khordad"
	  smonthNumber=3
	 else
	  sMonth="Tir"
	  smonthNumber=4
	  sDay=$[sDay-31]
	 fi ;;
	 
	 7) sDay=$[day+9];
	 if [ $sDay -lt 32 ]; then
	  sMonth="Tir"
	  smonthNumber=4
	 else
	  sMonth="Mordad"
	  smonthNumber=5
	  sDay=$[sDay-31]
	 fi ;;
	 
	 8) sDay=$[day+9];
	 if [ $sDay -lt 32 ]; then
	  sMonth="Mordad"
	  smonthNumber=5
	 else
	  sMonth="Shahrivar"
	  smonthNumber=6
	  sDay=$[sDay-31]
	 fi ;;
	 
	 9) sDay=$[day+9];
	 if [ $sDay -lt 32 ]; then
	  sMonth="Shahrivar"
	  smonthNumber=6
	 else
	  sMonth="Mehr"
	  smonthNumber=7
	  sDay=$[sDay-31]
	 fi ;;
	 
	 10) sDay=$[day+8] ;
	 if [ $sDay -lt 31 ]; then
	  sMonth="Mehr"
	  smonthNumber=7
	 else
	  sMonth="Aban"
	  smonthNumber=8
	  sDay=$[sDay-30]
	 fi ;;
	 
	 11) sDay=$[day+9];
	 if [ $sDay -lt 31 ]; then
	  sMonth="Aban"
	  smonthNumber=8
	 else
	  sMonth="Azar"
	  smonthNumber=9
	  sDay=$[sDay-30]
	 fi ;;
	 
	 12) sDay=$[day+9];
	 if [ $sDay -lt 31 ]; then
	  sMonth="Azar"
	  smonthNumber=9
	 else
	  sMonth="Dey"
	  smonthNumber=10
	  sDay=$[sDay-30]
	 fi ;;
 esac
 #Year
if [ $smonthNumber -lt 11 ];then
	if [ $smonthNumber -eq 10 ] && [ $sDay -gt 10 ]; then
	   sYear=$[year-622]
	else
	sYear=$[year-621]
	fi
else
	if [ $smonthNumber -eq 10 ] && [ $sDay -lt 11 ]; then
	   sYear=$[year-621]
	else
	sYear=$[year-622]
	fi
fi
#KABISE?----------------------------
if [ $kabise -eq 3 ];then
	   sDay=$[sDay+1]
fi
}

#main-------------------------------
case $1 in
	"") Check;
	echo "$sDay $sMonth $sYear";;
	
	"-n") Check;
	echo "$sYear/$smonthNumber/$sDay";;
	
	"-s") read  year;
	Check;
	echo "$sYear/$smonthNumber/$sDay";;
	
	"-h") echo "created by amir mohammadi :)";;
esac
