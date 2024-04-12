#!/run/current-system/sw/bin/bash

wifi_ssid=$(iwgetid -r)
if [ -z "$wifi_ssid" ]; then
  echo "offline"
  exit
fi

ping_result=$(ping -c 1 -w 2 1.1.1.1)

if [[ $ping_result == *"Destination Port Unreachable"* ]]; then
    echo "offline"
    exit
fi

ping_result=$(ping -c 1 -w 2 1.1.1.1 | awk -F'/' 'END{print $5}')

if [ -n "$ping_result" ]; then
  delay=$(echo "$ping_result" | awk '{print int($1)}')

  if [ ${#delay} -eq 1 ]; then
    echo "   ${delay}ms"
  elif [ ${#delay} -eq 2 ]; then
    echo "  ${delay}ms"
  elif [ ${#delay} -eq 3 ]; then
    echo " ${delay}ms"
  else
    echo "${delay}ms"
  fi
else
  echo " high "
fi

