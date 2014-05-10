
sql program to track working ours by hooking to pm-util suspend operation.
when computer wakes then it stores start of the day, 
and when it is last suspended it marks end of the day .

setup.sh : 
  creates database which requires mysql root access

00working_hours.pm.sh: 
  should be copied to /etc/pm/sleep.d/ and 
  made executable by chmod +x 00working_hours.pm.sh

working_hours.sh:
  should be copied to ~/bin or /usr/bin/ and made excutable
  see documentation inside for usage .
