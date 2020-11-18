------------------------ MODULE river_crossing ------------------------

EXTENDS FiniteSets, Integers

VARIABLES left, boat, right

(* Hints:
    * left, boat, and right are all Sets
    * The size of a set is given by Cardinality(set)
    * For other ideas on how to work with sets,
      see group-placement.tla
*)

Init ==
    /\ left  = {"farmer", "fox", "goat", "cabbage"}
    /\ boat  = {}
    /\ right = {}

Next ==
    /\ left'  = left
    /\ boat'  = boat
    /\ right' = right

(* When you think you've solved the puzzle,
   turn this invariant back on so that the
   error trace shows you the steps leading
   up to it *)
Invariant ==
    TRUE
    \* right /= {"farmer", "fox", "goat", "cabbage"}

=======================================================================