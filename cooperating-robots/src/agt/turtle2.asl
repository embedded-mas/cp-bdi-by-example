//initial beliefs
moving_count(0).


//if the robot has given less than 5 steps: keep moving
+!move: .random(X) & .random(Y) & moving_count(C) & C<=5
   <- .move_turtle(X,Y);
      -+moving_count(C+1);
      .wait(500);
      !move.

//if the robot has given 5 steps or more: stop moving and ask turte2 to move
+!move
   <- -+moving_count(0);
      .send(turtle1,achieve,move).


//handle exceptions on moving
-!move
   <- .wait(1000); //wait a second
      !move. //try again



      
//react to topic-based belief changes      
+turtle_position(x(X),y(Y),theta(T),linear_velocity(LV),angular_velocity(AV))
   <- .print("Position changed. x: ", X, "; y: ", Y, "; theta: ", T, "; linear velocity: ", LV, "; angular velocity: ", AV).  
      
     

