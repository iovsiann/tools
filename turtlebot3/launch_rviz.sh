#!/bin/bash
# Launch rviz

roslaunch turtlebot3_bringup turtlebot3_remote.launch &
sleep 2
rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
