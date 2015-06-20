#!/bin/bash
# this script take month 00 to 12 and prints the season

getSeason()
{
case "$1" in
   0[3-6]|[3-6]) echo "SUMMER" ;;
   0[7-9]|[7-9]|10) echo "MONSOON" ;;
   0[0-2]|[0-2]|[11-12]) echo "WINTER" ;;
esac
}

getSeason $1
exit 0


