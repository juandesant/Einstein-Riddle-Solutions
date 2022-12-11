right_of(X, Y) :- X =:= Y+1.
left_of(X, Y)  :- right_of(Y, X).

next_to(X, Y)  :- right_of(X, Y).
next_to(X, Y)  :- left_of(X, Y).

solution(Street) :-
   /* There are 5 houses in the street, all of different colours; 
      and their owners all have different nationalities, smoke different brands,
      have different pets, and have different drinks */
    Street = [
        house(1, Color1, Nationality1, Smoke1, Pet1, Drink1),
        house(2, Color2, Nationality2, Smoke2, Pet2, Drink2),
        house(3, Color3, Nationality3, Smoke3, Pet3, Drink3),
        house(4, Color4, Nationality4, Smoke4, Pet4, Drink4),
        house(5, Color5, Nationality5, Smoke5, Pet5, Drink5)],
    member(house(_,red    ,brit     ,_           ,_      ,_      ), Street), /* The Brit lives in the red house */
    member(house(_,_      ,swede    ,_           , dogs  ,_      ), Street), /* The Swede lives with dogs */
    member(house(_,_      ,dane     ,_           ,_      ,tea    ), Street), /* The Dane drinks tea */
    member(house(GreenHouse, green ,_ ,_ ,_ ,_ ), Street), /* There is a green house... */
    member(house(WhiteHouse, white ,_ ,_ ,_ ,_ ), Street), /* ...and a white house... */
    left_of(GreenHouse,WhiteHouse),                        /* ...and the green one is left to the white one. */
    member(house(_,green  ,_        ,_           ,_      ,coffee ), Street), /* The person in the green house drinks coffee */
    member(house(_,_      ,_        ,pall_mall   , birds ,_      ), Street), /* The person who smokes Pall Mall rears birds */
    member(house(_,yellow ,_        ,dunhill     ,_      ,_      ), Street), /* The person in the yellow house smokes Dunhill */
    member(house(3,_      ,_        ,_           ,_      ,milk   ), Street), /* The person in the middle house drinks milk */
    member(house(1,_      ,norwegian,_           ,_      ,_      ), Street), /* The Norwegian lives in the first house. */
    member(house(Blendie ,_ ,_ ,blends ,_   ,_ ), Street), /* The person that smokes Blends... */
    member(house(CatLover,_ ,_ ,_      ,cats,_ ), Street), /* ...and the person who loves cats... */
    next_to(Blendie, CatLover),                            /* ...live next to each other */
    member(house(Dunhillie ,_ ,_ ,dunhill,_     ,_ ), Street), /* The person that smokes Dunhills... */
    member(house(HorseLover,_ ,_ ,_      ,horses,_ ), Street), /* ...and the person that loves horses... */
    next_to(Dunhillie, HorseLover),                            /* ...live next to each other */
    member(house(_,_      ,_     ,blue_master,_      ,beer   ), Street), /* The person smoking Blue Master drinks beer */
    member(house(_,_      ,german   ,prince      ,_      ,_      ), Street), /* The German smokes Prince */
    member(house(BlueOwner,blue ,_ ,_ ,_ ,_ ), Street),      /* The person in the Blue House... */
    member(house(Norwegian,_ ,norwegian ,_ ,_ ,_ ), Street), /* and the Norwegian... */
    next_to(BlueOwner,Norwegian),                            /* ...live next to each other */                                                 
    member(house(Blendie,_,_,blends,_,_),Street),            /* The person that smokes Blends... */
    member(house(WaterDrinker,_,_,_,_,water),Street),        /* And the person that drinks water... */
    next_to(Blendie,WaterDrinker),                           /* ...live next to each other */         
    member(house(_,_      ,_        ,_           , fish  ,_      ), Street). /* Someone has a fish */

/* Resolve with 
 *     solution(Street)
 * or
 *     solution(Street), member(house(_,FishOwner,_,_,_,_),Street)
 * Demonstrate uniqueness with
 *     aggregate_all(count, (solution(Street)), Count).
 */