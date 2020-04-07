#!/bin/bash
# Launch rviz

roslaunch turtlebot3_bringup turtlebot3_remote.launch
rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz
