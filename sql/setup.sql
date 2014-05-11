drop database if exists working_hours;

create database working_hours;
create user worker@'localhost';
grant all on working_hours.* to worker@'localhost';
