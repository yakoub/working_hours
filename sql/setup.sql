drop database if exists working_hours;
-- drop user worker@'localhost';

create database working_hours;
create user worker@'localhost';
grant all on working_hours.* to worker@'localhost';
