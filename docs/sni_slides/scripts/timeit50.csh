#!/bin/csh

# this is the timer for a 16 minute talk
# We give warnings at 8 minutes, 13 minutes, 15 minutes, 16 minutes, and 17

set start_time=`get_time`
set next_time=$start_time
set state=1

set first_delay=10
set second_delay=8
# short delays for testing
#set first_delay=1
#set second_delay=1
set third_delay=25
set fourth_delay=5
set fifth_delay=2

# 15 min = 900 seconds
#@ next_time += $first_delay * 60
set seconds_per_minute=60
#set seconds_per_minute=4 # for testing
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
    show_alert "$total_delay minutes elapsed, should be done with first section..."
    @ next_time += $second_delay * $seconds_per_minute
    @ state ++
  else if( $state == 2 ) then
    @ total_delay += $second_delay
    show_alert "$total_delay minutes elapsed, should be done with second section..."
    @ next_time += $third_delay * $seconds_per_minute
    @ state ++
  else if( $state == 3 ) then
    @ total_delay += $third_delay
    show_alert "$total_delay minutes elapsed, wrap it up soon..."
    @ next_time += $fourth_delay * $seconds_per_minute
    @ state ++
  else if( $state == 4 ) then
    @ total_delay += $fourth_delay
    show_alert "$total_delay minutes elapsed"
    @ next_time += $fifth_delay * $seconds_per_minute
    @ state ++
  else if( $state == 5 ) then
    @ total_delay += $fifth_delay
    show_alert "$total_delay minutes elapsed, STOP NOW"
    @ next_time += $fifth_delay * $seconds_per_minute
  endif
end


