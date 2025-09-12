counter(0).

!update_topic_value.
!update_current_value.



+!update_topic_value: value1(V) //belief obtained from a ROS topic
   <- .print("Topic value ", V);
      //.wait(100);
      .update_value1(V+1); //update the topic value
      //.teste(V+1); //update the topic value
      !update_topic_value.


      
-!update_topic_value
   <- .wait(100);
      !update_topic_value.

+counter(V)
   <- .print("Counter: ", V);
      -+counter(V+1);
      !update_current_value.