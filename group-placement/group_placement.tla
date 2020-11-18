---- MODULE group_placement ----

EXTENDS FiniteSets

CONSTANTS miradoers,
          liveTogether,
          preferIndividual

VARIABLES unplaced,
          groups

Init ==
    /\ unplaced = miradoers
    /\ groups   = {}

NextGroupPlacement ==

    \E subgroup \in SUBSET unplaced:

        \* Allow groups of 2 or 3
        /\ Cardinality(subgroup) \in {2, 3}

        \* Don't separate groups who already live together
        /\ \/ subgroup \in liveTogether
           \/ \A lt \in liveTogether: subgroup \intersect lt = {}

        \* Don't include those who prefer to work individually
        /\ \A m \in subgroup: m \notin preferIndividual

        /\ unplaced' = unplaced \ subgroup
        /\ groups'   = groups \union {subgroup}

        \* Do not leave anyone by themselves in unplaced
        /\ Cardinality(unplaced') /= 1

NextIndividualPlacement ==
    \E m \in unplaced:
        /\ m \in preferIndividual
        /\ unplaced' = unplaced \ {m}
        /\ groups'   = groups \union {{m}}

AllIndividualsPlaced ==
    \A m \in unplaced: m \notin preferIndividual

Next ==

    \/ /\ AllIndividualsPlaced
       /\ NextGroupPlacement

    \/ NextIndividualPlacement

EveryoneAccountedFor ==
    \* Every miradoer...
    \A m \in miradoers:

        \* is either unplaced...
        \/ m \in unplaced

        \* ... or in a group
        \/ \E sg \in groups: m \in sg

EveryoneEventuallyPlaced ==
    <>[]
       \A m \in miradoers:
         \E sg \in groups: m \in sg

NotDone ==
    TRUE
    \* unplaced /= {}

Spec ==
    /\ Init
    /\ [][Next]_<<unplaced, groups>>
    /\ WF_<<unplaced, groups>>(Next)

====