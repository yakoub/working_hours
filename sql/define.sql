create table working_track (
  day Date primary key,
  start Time,
  end Time
);

delimiter ] 
create procedure insure_day()
begin
  insert ignore into working_track (day)
  values(current_date());
end ]

create procedure set_day(in day Date, in start Time, in end Time)
begin
  insert ignore into working_track 
  values(day, start, end)
  on duplicate key update start = start, end = end;
end ]

create procedure start_day()
begin
  call insure_day();

  update working_track 
  set start = current_time()
  where day = current_date() and start is null;
end ]

create procedure end_day()
begin
  call insure_day();

  update working_track 
  set end = current_time() 
  where day = current_date();
end ]

create procedure report_month(in month int)
begin
  declare month_total bigint;

  select 
    date_format(day, '%d') as Day,
    start as Start,
    end as End,
    time_format( timediff(end, start), '%H:%i') as Total
  from working_track 
  where month(day) = month; 

  select
    sum(time_to_sec(timediff(end, start))) into month_total
  from working_track
  where month(day) = month;
  
  select time_format(sec_to_time(month_total), '%H:%i') as 'Month total';
end ]

create procedure report_now()
begin
  select 
    day as Day,
    start as Start,
    end as 'Last End',
    current_time() as 'Now',
    time_format( timediff(current_time(), start), '%H:%i') as 'Current Total'
  from working_track 
  where day = current_date(); 
end ]

delimiter ;
