#!/bin/csh

#set seconds_per_minute=2
set seconds_per_minute=60

# this is the timer for a 12 minute talk
# We give warnings at 6 minutes, 10 minutes, 11 minutes, 12 minutes

set start_time=`get_time`
set next_time=$start_time
set state=1

set first_delay=6
set second_delay=4
# short delays for testing
#set first_delay=1
#set second_delay=1
set third_delay=1
set fourth_delay=1
set fifth_delay=1

# 15 min = 900 seconds
@ next_time += $first_delay * $seconds_per_minute

set total_delay=0

while( 1 )
  set now_time=`get_time`
  #echo now_time = $now_time
  #echo next_time = $next_time
  @ time_to_sleep = $next_time - $now_time
  #echo time_to_sleep = $time_to_sleep seconds
  if( $time_to_sleep > 0 ) then
    sleep $time_to_sleep
  endif
  if( $state == 1 ) then
    @ total_delay += $first_delay
    show_alert "$total_delay minutes elapsed, halfway done, keep it moving..."
    @ next_time += $second_delay * $seconds_per_minute
    @ state ++
  else if( $state == 2 ) then
    @ total_delay += $second_delay
    show_alert "$total_delay minutes elapsed..."
    @ next_time += $third_delay * $seconds_per_minute
    @ state ++
  else if( $state == 3 ) then
    @ total_delay += $third_delay
    show_alert "$total_delay minutes elapsed, wrap it up!"
    @ next_time += $fourth_delay * $seconds_per_minute
    @ state ++
  else if( $state == 4 ) then
    @ total_delay += $fourth_delay
    show_alert "$total_delay minutes elapsed, STOP NOW..."
    @ next_time += $fifth_delay * $seconds_per_minute
    @ state ++
  else if( $state == 5 ) then
    @ total_delay += $fifth_delay
    show_alert "$total_delay minutes elapsed, did you think I was joking???"
    exit
  endif
end


