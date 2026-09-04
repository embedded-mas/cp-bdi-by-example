!move.

//test service request without response
+!move: .random(X) & .random(Y) & .random(Z)
   <- embedded.mas.bridges.jacamo.defaultEmbeddedInternalAction("sample_roscore","move_turtle", [[X,Y,Z],[X*2,Y*2,Z*2]] );      
      .wait(500);
      !move.



+position(x(X),y(Y))
   <- .print("Current position: (",X,",",Y,")").