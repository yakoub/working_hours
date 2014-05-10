#!/usr/bin/bash

worker_mysql="mysql -u worker working_hours"

case "$1" in 
  hibernate|suspend)
    $worker_mysql -e 'call end_day()'
  ;;
  thaw|resume)
    $worker_mysql -e 'call start_day()'
  ;;
esac
