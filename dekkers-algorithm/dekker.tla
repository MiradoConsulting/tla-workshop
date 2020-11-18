---- MODULE dekker ----
EXTENDS Integers

(* --algorithm dekker

variable wantp      = FALSE,
         wantq      = FALSE,
         turn       = 1,
         in_crit    = 0,
         p_had_turn = FALSE,
         q_had_turn = FALSE

define

    SAFETY ==
        in_crit \in {0, 1}

    PROGRESS ==
        /\ <> p_had_turn
        /\ <> q_had_turn

end define;

fair process processp = "Process P"
begin
    A: while TRUE do
    B:   wantp := TRUE;
    C:   while wantq do
    D:     if turn = 2 then
    E:       wantp := FALSE;        
    F:       while turn /= 1 do
    G:         skip;
             end while;
    H:       wantp := TRUE;
           end if;
         end while;

    C1:  in_crit    := in_crit + 1;
    C2:  p_had_turn := TRUE;
    C3:  in_crit    := in_crit - 1;

    I:   turn  := 2;
    J:   wantp := FALSE;
       end while;
end process;

fair process processq = "Process Q"
begin
    A: while TRUE do
    B:   wantq := TRUE;
    C:   while wantp do
    D:     if turn = 1 then
    E:       wantq := FALSE;        
    F:       while turn /= 2 do
    G:         skip;
             end while;
    H:       wantq := TRUE;
           end if;
         end while;

    C1:  in_crit    := in_crit + 1;
    C2:  q_had_turn := TRUE;
    C3:  in_crit    := in_crit - 1;

    I:   turn  := 1;
    J:   wantq := FALSE;
       end while;
end process;

end algorithm; *)

====
