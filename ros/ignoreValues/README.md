# 1. Example overview
Cyber-Physical BDI whose body includes ROS-based devices have perceptions obtained from ROS topics. ROS topic messages may contain multiple fields, and some of these fields may not be relevant to the corresponding perception. The *ignoreValues* configuration field allows undesired fields to be excluded.

# 2. Application Scenario
This example contains a randomly moving turtle agent (see the agent code [here](src/agt/sample_agent.asl)). The turtle agent moves itself by executing the action ```move_turtle```. This agent acquires two perceptions from ROS topics: `position` and `velocity`. They are acquired, respectively, from the topics `turtle1/pose` and `turtle1/cmd_vel`. Their structure is given in the following:

turtle1pose:
```
float32 x
float32 y
float32 theta
float32 linear_velocity
float32 angular_velocity
```
turtle1/cmd_vel:
```
geometry_msgs/Vector3 linear
  float64 x  
  float64 y  
  float64 z  
geometry_msgs/Vector3 angular
  float64 x  
  float64 y  
  float64 z  
```

Suppose that in the case of `position`, the fields `theta`, `linear_velocity` and `angular_velocity` should be ignored. In the case of `velocity`, the fields to be ignored are `angular` and `z`, which is nested in `linear`.


## Setting the values to be ignored
Values to be ignored must be listed under the key `ignoreValues` in the configuration of the perception topics, as shown in the following configuration, excerpted from [this yaml file](src/agt/sample_agent.yaml).
```
perceptionTopics:         
   - topicName: turtle1/pose
        topicType: turtlesim/Pose
        beliefName: position
        ignoreValues:
           - theta
           - linear_velocity
           - angular_velocity
   - topicName: turtle1/cmd_vel
        topicType: geometry_msgs/Twist
        beliefName: velocity
        ignoreValues:
           - linear.z
           - angular
```

Notice that nested fields are chained with a `.`, as in the case of `linear.z`.

# 3. Requirements
- Java JRE >= 21
- [Docker](https://www.docker.com/)


# 4. Running the example
- `./launch_ros.sh` (preceed with `sudo` if needed), to launch the ROS nodes;
- `.gradlew run`, to start tje JaCaMo application.
