//initial goals
!move. //randomly move around the environment
!check_position. //constantly check the current position


      
     
+!move: .random(X) & .random(Y)
   <- .move_turtle(X,Y);
      .wait(500);
      !move.



+!check_position : position(X,Y) 
   <- .print("Current position: (",X,",",Y,")");
      .wait(position(NewX,NewY)&NewX\==X&NewY\==Y);
      !check_position.
   

-!check_position 
   <- .wait(position(X,Y));
      !check_position.