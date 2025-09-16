# 1. Example overview
[Default internal actions](https://jason-lang.github.io/api/jason/asSemantics/DefaultInternalAction.html) block the agent execution until finishing. However, it might be necessary the agents to keep running while an internal action is being processed. 


This application example illustrates the specification of [*concurrent internal actions*](https://jason-lang.github.io/api/jason/asSemantics/ConcurrentInternalAction.html). They block only the intention that calls the internal action. Other intentions keep running.



# 2. Application Scenario
The application contains an agent that has two goals: *update_topic_value* and *update_counter*. While the latter goal updates an internal counter, recorded as a belief, the former uses the internal action `update_value` to update the value of a ROS topic. If `update_value` is a default internal action, the acting for achieving the goal *update_counter* is paused when this action is executed. Thus, the internal counter is updated only while the internal action is not being executed. On the other hand, if this internal action is a concurrent one, the goal *update_counter* keeps running while the internal action is executed and, thus, is constantly executed.



To set an internal action as *concurrent*, go to the corresponding [yaml file](src/agt/sample_agent.yaml) and add the entry `concurrent: true` to the action configuration (cf. example below). To set the internal action as a default one, set the value of `concurrent` to false or simply remove the entry. 

```
   topicWritingActions:          
      - actionName: update_value
        topicName: /value1
        topicType: std_msgs/Int32
        concurrent: true
```        

The output of the system shows the update values of both the ROS topic and the internal counter. It is possible to observe that the concurrent internal action allows more updates in the counter between two updates of the ROS topic. This is because the update of the ROS topic os concurrent and, thus, does not block the update of the internal counter. The table below illustrates outputs for both types of internal actions.


| Default Internal Action | Concurrent Internal Action |
|----------|----------|
| Topic value 1<br>Counter: 23<br>Counter: 24  <br> <br><br><br><br><br><br><br>| Topic value 1<br>Counter: 101<br>Counter: 102<br>Counter: 103<br>Counter: 104<br>Counter: 105<br>Counter: 106<br>Counter: 107<br>Counter: 108<br>Counter: 109 |
| Topic value 2<br>Counter: 25<br>Counter: 26<br><br><br><br><br><br><br><br><br>| Topic value 2<br>Counter: 110<br>Counter: 111<br>Counter: 112<br>Counter: 113<br>Counter: 114<br>Counter: 115<br>Counter: 116<br>Counter: 117<br>Counter: 118<br>Counter: 119 |
| Topic value 3<br>Counter: 27<br>Counter: 28<br>Counter: 29 <br><br><br><br><br><br><br>| Topic value 3<br>Counter: 120<br>Counter: 121<br>Counter: 122<br>Counter: 123<br>Counter: 124<br>Counter: 125<br>Counter: 126<br>Counter: 127<br>Counter: 128 |
| Topic value 4<br>Counter: 30 <br><br><br><br><br><br><br><br><br><br>| Topic value 4<br>Counter: 129<br>Counter: 130<br>Counter: 131<br>Counter: 132<br>Counter: 133<br>Counter: 134<br>Counter: 135<br>Counter: 136<br>Counter: 137<br>Counter: 138 |
| Topic value 5<br>Counter: 31<br>Counter: 32 <br><br><br><br><br><br><br>| Topic value 5<br>Counter: 139<br>Counter: 140<br>Counter: 141<br>Counter: 142<br>Counter: 143<br>Counter: 144<br>Counter: 145<br>Counter: 146<br>Counter: 147 |
| Topic value 6<br>Counter: 33<br>Counter: 34 <br><br><br><br><br> <br><br> <br> <br> <br> <br> | Topic value 6<br>Counter: 148<br>Counter: 149<br>Counter: 150<br>Counter: 151<br>Counter: 152<br>Counter: 153<br>Counter: 154<br>Counter: 155<br>Counter: 156<br>Counter: 157<br>Counter: 158<br>Counter: 159 |


# 3. Running the example

Requirements: - Java JRE >= 17


To run the example, exeute the following steps in a shell:
1. type `./launch_ros.sh` (preced with `sudo` if needed) to launch the required ROS node;
2. type `./gradlew run` to launch the JaCaMo application.
