#!/bin/bash

docker exec -d embedded-mas-example2 bash -c "rosnode kill /rosbridge_websocket; source /opt/ros/noetic/setup.bash; roslaunch rosbridge_server rosbridge_websocket.launch port:=9091 &"
docker exec -d embedded-mas-example2 /bin/bash -c "source /opt/ros/noetic/setup.bash && rostopic pub value1 std_msgs/Int32 0"