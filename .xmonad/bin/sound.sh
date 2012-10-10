#!/bin/sh

iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

level=$(amixer sget Master |grep Playback|grep '\[on\]'|awk '{print $4}'|sed -r 's/^.?([0-9]+).*$/\1/')
bars=$(( $level / 10 ))

#echo $level
#echo $bars
#essid=`iwconfig wlan0 | awk -F '"' '/ESSID/ {print $2}'`
#stngth=`iwconfig wlan0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
#bars=`expr $stngth / 10`

case $bars in
  0)  bar='[----------]' ;;
  1)  bar='[/---------]' ;;
  2)  bar='[//--------]' ;;
  3)  bar='[///-------]' ;;
  4)  bar='[////------]' ;;
  5)  bar='[/////-----]' ;;
  6)  bar='[//////----]' ;;
  7)  bar='[///////---]' ;;
  8)  bar='[////////--]' ;;
  9)  bar='[/////////-]' ;;
 10)  bar='[//////////]' ;;
  *)  bar='[----!!----]' ;;
esac

echo Volume: $bar


