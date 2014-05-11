#!/bin/bash
echo "warning: database \"working hours\" will be erased"
echo "enter mysql root password:"
mysql -u root -p < sql/setup.sql 
mysql -u worker working_hours < sql/define.sql
mysql -u worker working_hours -e 'call start_day()' 
