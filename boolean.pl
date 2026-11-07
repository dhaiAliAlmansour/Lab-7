:- dynamic basket/1.

start :-
    assertz(basket([milk, bread, eggs, juice, cheese])),
    menu.

menu :-
    nl,
    writeln('Shopping Menu'),
    writeln('d - Display items'),
    writeln('a - Add item'),
    writeln('e - Exit'),
    write('Choose: '),
    read(Choice),
    handle(Choice).

handle(d) :-
    basket(List),
    display_items(List),
    menu.

handle(a) :-
    write('Enter item: '),
    read(Item),
    basket(List),
    append(List, [Item], NewList),
    retract(basket(List)),
    assertz(basket(NewList)),
    menu.

handle(e) :-
    writeln('Goodbye!').

handle(_) :-
    writeln('Invalid choice'),
    menu.
display_items([]).

display_items([Head|Tail]) :-
    writeln(Head),
    display_items(Tail).