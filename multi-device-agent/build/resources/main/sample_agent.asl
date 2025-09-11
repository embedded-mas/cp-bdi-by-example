//initial goals
!move.

//testing service request without response
+!move: .random(X) & .random(Y)
   <- .move_turtle(X,Y);
      .wait(500);
      !move.


   
      
+value1(X)
   <- .print("Updating value1 from ", X, " to ", X+1);
      .update_value1(X+1).
