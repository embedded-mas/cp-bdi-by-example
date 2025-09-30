# 1. Application overview
Some topic values include nested structures. In the example below, the structure of the topic value has the fields `linear` and `angular`. Each of them has three nested fields (`x`, `y`, and `z`)

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


On the other hand, some topic values include *arrays* with nested structures. In the example below, the structure of the topic value has  three nested fields (`x`, `y`, and `z`). The value of the field `y` is an array of elements of the type ``embedded_mas_examples/ExampleArray``, which, in turn, is composed of the fields `y1` and `y2`
```
int32 x
embedded_mas_examples/ExampleArray[] y
  int32 y1
  int32 y2
int32 z
```

This application example illustrates the configuration of topic-based actions whose parameters include array values.

# 2. Application Scenario
The application contains an [agent](src/agt/sample_agent.asl) that simply executes the action `update_value`. This action is realized by writing in a topic whose values include arrays. Thus, the action of the agent also includes an array among its arguments.

## 2.1 Configuring actions with array parameters
The `update_value` is realized by writing in the topic `/array_topic`, of the type `embedded_mas_examples/ExampleMsgWithArray`, whose structure is:
```
int32 x
embedded_mas_examples/ExampleArray[] y
  int32 y1
  int32 y2
int32 z
```

The configuration of this action, specified [here](src/agt/sample_agent.yaml), is shown below. The parameters `x` and `z` are configured as usual. The parameter `y` is composed of three arrays of fields `y1` and `y2`.
```
topicWritingActions:          
   - actionName: update_value
      topicName: /array_topic
      topicType: embedded_mas_examples/ExampleMsgWithArray    
      params:  
         - x
         - y:
            - [y1, y2]
            - [y1, y2]
            - [y1, y2]
         - z
```

Array fields do not have identifiers (different of regular fields as `x`, `y`, and `z` in the example). Rather, they are specified as arrays whose elements are the identifiers of the fields nested in the array. 


## 2.2 Executing actions with array parameters
In this example, the action `update_value`, which has the array parameters, is specified in the agent code as:

```
 .update_value(1,[[2,3],[4,5],[6,7]],8).
```

The array parameter `y` is specified as an array of nested arrays, each of them including the values of the fields `y1` and `y2`.

# 3. Requirements
- Java JRE >= 17
- [Docker](https://www.docker.com/)

# 4. Running the example
Running the example requires two main steps:  
1. Launch the ROS infrastructure (cf. Section 4.1 below)
2. Launch the JaCaMo application (cf. Section 4.2 below)


## 4.1. Ros node setup:

Requirements: [Docker](https://www.docker.com/)


Use the following command to launch the ROS node. ```./launch_ros.sh``` (preceed with ```sudo``` if needed)

## 4.2. Launch the JaCaMo application:

### Linux:
```
./gradlew run
```
#### Windows:
```
gradlew run 
```


The agent will execute the action `update_value`. To check its result, go to the agent's mind inspector to observe a belief corresponding to the written topic value. As an alternative, inspect the topic by running `rostopic echo /array_topic`.
