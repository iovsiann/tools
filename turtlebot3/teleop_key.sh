#!/bin/bash
# Launch key tele-op on remote PC

# gnome-terminal -e "roscore"
# sleep 2
gnome-terminal -e "roslaunch turtlebot3_bringup turtlebot3_remote.launch"
sleep 2
gnome-terminal -e "roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch"
sleep 2
rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz &
rqt &
# gnome-terminal -e "rosrun rviz rviz -d `rospack find turtlebot3_description`/rviz/model.rviz"
# sleep 2
# gnome-terminal -e "rqt"
