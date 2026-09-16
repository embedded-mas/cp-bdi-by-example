!move.

//test service request without response
+!move: .random(X) & .random(Y) & .random(Z)
   <- .move(X,Y);
      .wait(500);
      !move.



+position(x(X),y(Y))
   <- .print("Current position: (",X,",",Y,")").