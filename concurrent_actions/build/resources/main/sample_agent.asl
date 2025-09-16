counter(0).
last_topic_value(-1).

// This agent has two goals   
!update_topic_value.
!update_counter.


+!update_topic_value: value(V) //belief obtained from a ROS topic
                      & last_topic_value(L) & V>L
   <- .print("Topic value ", V);
      .update_value(V+1); //update the topic value
      -+last_topic_value(V);  
      !update_topic_value.

      
+!update_topic_value
   <- !update_topic_value.

+!update_counter : counter(V)
   <- .print("Counter: ", V);
      -+counter(V+1);
      !update_counter.


+value(1001) <- .stopMAS.      