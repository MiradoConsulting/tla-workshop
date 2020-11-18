------------------------ MODULE jugs ------------------------

EXTENDS Integers

VARIABLES jug3, jug5

Min(a, b) ==
    IF a < b
        THEN a
        ELSE b

Init ==
    /\ jug3 = 0
    /\ jug5 = 0

Next ==
    /\ jug3' = jug3
    /\ jug5' = jug5

(* When you think you've solved the puzzle,
   turn this invariant back on so that the
   error trace shows you the steps leading
   up to it *)
Invariant ==
    TRUE
    \* ~(jug5 = 4)

======================================================================