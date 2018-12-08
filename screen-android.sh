#!/bin/bash
DATE=`date '+%Y-%m-%d-%H:%M:%S'`
filename="screen-"$DATE".png"

var=$1

if [ "$var" = "NULL" ];then
  $var = ""
fi


if [ "$var" = "s" ];then
  echo "Captureing Picture in SED Mode"
  adb shell screencap -p | sed 's/\r$//' >  $filename
elif [ "$var" = "p" ];then
  echo "Capture Picture in Perl Mode"
  adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > $filename
else
  echo "Capture Picture in Default Mode"
  adb shell screencap -p /sdcard/$filename
  adb pull /sdcard/$filename .
  adb shell rm /sdcard/$filename
fi



echo $filename "Created."
