
// ***************************************************************************************************************************************
// Reactive behaviour - the agent reacts to perceptions about the light state.
// ***************************************************************************************************************************************
+light_state(0) : .random(X)
   <- .print("The light A is off. I must turn it on for ", (X*10000) div 1 , " milliseconds.");
       .lightOn((X*10000) div 1).


+light_state(1) <- .print("The light A is on. It is fine").


