and(true, true, true).
and(true, false, false).
and(false, true, false).
and(false, false, false).

or(true, true, true).
or(true, false, true).
or(false, true, true).
or(false, false, false).

not(true, false).
not(false, true).

boolean(A, B, Result) :-
    and(A, B, X),
    not(A, NA),
    not(B, NB),
    and(NA, NB, Y),
    or(X, Y, Result).
    