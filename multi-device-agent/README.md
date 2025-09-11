# 1. Application overview
Cyber-Physical BDI agents are composed from one to many *devices*. A *device* is a portion of the physical body, containing sensors and actuators, typically connected to a controller hardware (e.g. microcontroller boards) and handled by a controller software (e.g.~ROS nodes, MQTT brokers,  C++ programs embedded in Arduino boards, etc). 

This example illustrates an agent composed of two devices. For simplicity, these devices are ROS hosts, but they could also be of other, even mixed, types.

# 2. Application Scenario
This application contains an agent composed of two devices, which are ROS hosts. These devices are specified in a [yaml file](src/agt/sample_agent.yaml) with the same name as the agent, placed in the same folder as the asl file where the agent is specified.

 The first device, called `roscore1`, points to a ROS node running the *turtlesim* simulator. It provides the perception `turtle_position` and the action `move_turtle`. 
 
 The second device, called `roscore2`, points to a ROS node which provides the perception `value1` and the action `update_value1`.

 These ROS nodes run in different containers and are, thus, independent. When the agent runs, the output of the first node (a turtle moving in the environment) can be seen in a browser at [http://localhost:8080/vnc.html](http://localhost:8080/vnc.html). The output of the second node (the log of the updated value) can be seen in the JaCaMo console.


# 3. Requirements
- Java JRE >= 17
- [Docker](https://www.docker.com/)


# 4. Running the example
- `./launch_ros.sh` (preceed with `sudo` if needed), to launch the ROS nodes;
- `./config_container` (preceed with `sudo` if needed), to configure multiple containers to run in the same host;
- `.gradlew run`, to start tje JaCaMo application.