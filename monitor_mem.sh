#! /bin/bash

echo "========================================"
echo "Monitoring $1"
echo "========================================"

# Get header
# Semi-arbitrary seds and greps to get rid of some weird spawned processes
# and trailing whitespace when running this on VM
echo "$(date +'%Y-%m-%d %H:%M:%S')   $(top -b -c -n 1 | grep PID | grep -v grep)" | sed 's/ *$//'

while true
do
  pid=$(pgrep -f $1 | grep -v $$)
  if [[ $pid != "" ]]
  then
    echo "$(date +'%Y-%m-%d %H:%M:%S')   $(top -b -c -n 1 | grep "^[ ]*$pid" | grep -v grep)" | sed 's/ *$//'
  fi
  sleep 1
done

