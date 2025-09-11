#!/bin/bash
set -e

# stop running containers
(docker ps -q --filter "name=novnc" | grep -q . && docker stop novnc || true)
(docker ps -q --filter "name=embedded-mas-example1" | grep -q . && docker rm -f embedded-mas-example1 || true)
(docker ps -q --filter "name=embedded-mas-example2" | grep -q . && docker rm -f embedded-mas-example2 || true)

sleep 2

( docker network inspect ros >/dev/null 2>&1 ||  docker network create ros)
( docker volume inspect x11socket >/dev/null 2>&1 ||  docker volume create x11socket)

 docker run -d --rm --net=ros     --env="DISPLAY_WIDTH=3000"     --env="DISPLAY_HEIGHT=1800"     --env="RUN_XTERM=no"     --name=novnc -p=8080:8080 theasp/novnc:latest

docker run --rm -d --net=ros     --env="DISPLAY=novnc:0.0"     --env="ROS_MASTER_URI=http://embedded-mas-example1:11311"     --name embedded-mas-example1     -p 9090:9090     maiquelb/embedded-mas-ros:latest 

 docker run --rm -d --net=ros --env="ROS_MASTER_URI=http://embedded-mas-example2:11311" --name embedded-mas-example2     -p 9091:9091     maiquelb/embedded-mas-ros:latest 

sleep 2

docker exec -d embedded-mas-example1 /bin/bash -c "source /opt/ros/noetic/setup.bash && rosrun turtlesim turtlesim_node "


#docker exec -d embedded-mas-example2 bash -c "rosnode kill /rosbridge_websocket; source /opt/ros/noetic/setup.bash; roslaunch rosbridge_server rosbridge_websocket.launch port:=9091 &"

./config_container.sh

docker exec -d embedded-mas-example2 /bin/bash -c "source /opt/ros/noetic/setup.bash && rostopic pub value1 std_msgs/Int32 0"

sleep 2

echo -e "\e[1;33m**** Docker container is ready. Open http://localhost:8080/vnc.html ****\e[0m"	
