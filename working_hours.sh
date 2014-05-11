#!/bin/bash

# working_hours.sh COMMAND
# COMANDS:
#       report n, display report of month n where n in [1,12]
#       report, display report of current month
#       current, display today's hours until current time
#       start, store current time as today's start, unless previous start have been stored
#       end, store current time as today's end
#       set DATE START END, override logic and set manual entry


worker_mysql="mysql -u worker working_hours"
case "$1" in 
  (report)
    month=`date +%m`
    if [[ -n $2 ]];
    then
      month=$2;
    fi
    $worker_mysql -e 'call report_month('$month')'
  ;;
  (current)
    $worker_mysql -e 'call report_now()'
  ;;
  (start)
    $worker_mysql -e 'call start_day()'
  ;;
  (end)
    $worker_mysql -e 'call end_day()'
  ;;
  (set)
    if [[ -z $2 || -z $3 || -z $4 ]];
    then
      echo "missing arguments";
    else
    $worker_mysql -e "call set_day('$2', '$3', '$4')";
    fi
  ;;
  (*)
    $worker_mysql -e 'call report_now()'
  ;;
esac
