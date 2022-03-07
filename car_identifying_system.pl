go:-
hypothesis(Car),
write('I believe that the car is '),
write(Car),
nl,
write('THANK YOU '),
undo.
 /*Hypothesis that should be tested*/
hypothesis(mercedes_maybach)     :-mercedes_maybach,!.
hypothesis(ferari_sergio)      :-ferari_sergio,!.
hypothesis(bugatti_voiture_noire)  :-bugatti_voiture_noire,!.
hypothesis(lamborghini_veneno)  :-lamborghini_veneno,!.
hypothesis(rolls_royce)  :-rolls_royce,!.
hypothesis(pagani_zonda)  :-pagani_zonda,!.
hypothesis(others). /*no diagnosis */
/*Hypothesis(car) Identification Rules*/
mercedes_maybach:-
verify(year:2005),
verify(engine:twinturbo_V12),
verify(horsepower:fivehundredfifty),
verify(price:eight_million_dollar),
verify(speed:two_hundred_seventeen_mph),
/*if all these rules become true than hypothesis related to it will be fired
and if anyone of the rule become false then code goes below to next hypothesis and so on.*/
write('Built by a German luxury car manufacturer, Maybach Exelero is known for its peculiar design and price tag of $8 million. Only one model of the car has ever been produced. The car was commissioned by a tire company that wanted to test its new line of tire family. Each tire features a code, specifying its dimensions and limitations. And to prevent the wheels from locking up during braking, the car is equipped with ABS. The interior of the car is embellished with dark and red leather, neoprene, and glossy black carbon fiber.'),
nl,
write('You can go for new model of car'),
nl.
ferari_sergio:-
verify(year:2013),
verify(engine:ferrari_f136_f_V8),
verify(horsepower:fivehundredseventy),
verify(price:three_million_dollor),
verify(speed:one_hundred_ninetyeight_mph),
write('This is one of the costliest Ferraris ever made and is based on the Ferrari 458 Spider. Each of the handmade units has an all-carbon-fibre frame, and is an open air luxury car with two seats. It has no roof, side windows and windshield, and is 330 pounds lighter than its ancestor. This makes it smarter and quicker, though it has the same naturally-aspirated 4.5 liter F136F V-8 engine, which sends 562 hp to the rear wheels. The coolest fact about this car though is that the owners of each of the six models were chosen by the manufacturers themselves, making this one of the rarest of the rare invite-only vehicles.'),
nl,
write('You can also go for next model of car'),
nl.
bugatti_voiture_noire:-
verify(year:2019),
verify(engine:eightL_W16),
verify(horsepower:fifteenhundred),
verify(price:nineteen_million_dollor),
verify(speed:two_hundred_fifty_three_mph),
write('Bugatti is “the black car” made entirely from carbon fiber. Bugatti has refused to reveal its performance specifications. The front is dominated by the trademark horseshoe-shaped Bugatti grill and blends into an aerodynamically swept-back design with sloping windscreen and wrap-around tail lamps.'),
nl,
write('Most expensive car in the world'),
nl.
lamborghini_veneno:-
verify(year:2013),
verify(engine:l539_v12),
verify(horsepower:750),
verify(price:five_milliondollor),
verify(speed:two_hundred_twenty_one_mph),

write(' Looking almost like an alien space capsule, this car can reach speeds that can give one of those a run for their money, literally. The sprung portion is placed on the top of a pushrod-actuated suspension, and its total dryweight of this carbon-fiber vehicle is a mere 3,285 pounds, although it is driven by a full all-wheel-drive system.'),
nl.
rolls_royce :-
verify(year:2017),
verify(engine:sevenL_v12),
verify(horsepower:453),
verify(price:thirteenmilliondollor),
verify(speed:one_hundred_fifty_mph),
write(' It is the exclusive car comes with its custom coach work, reminiscent of the royal carriages of yore. Probably modeled on the Wraith, this car can seat only two people (see what they mean by being exclusive?). The sunroof is fully panoramic, tapering down sharply like those of the racing yachts, as per the orders of the customer. Something very cool about the interior handcrafted with wood and leather are the hidden attaché cases for holding laptops behind each door. Not much else is available on this most expensive car in the world, except that it is based on the 1920s and 30s models, and looks like a yacht from the back.'),
nl.
pagani_zonda :-
verify(year:2018),
verify(engine:sevenl_v12),
verify(horsepower:sevenhundredsixty),
verify(price:eighteen_million_dollar),
verify(speed:two_hundered_ten_mph),

write(' The blue-tinted frame of the car is formed entirely of carbon fiber. The chassis is developed from what Pagani claims to be the material called ‘Carbo Titanium’. The car, made ultralight by the material, offers a thrilling experience of the speed to its driver. Though Pagani has never released the vehicle’s official performance specifications, some sources speculate the supercar boasts a top speed of 338 km/h. This open-top convertible supercar stands only some 21 inches tall at its tallest. It’s equipped with a huge ventilated 380m disc on all four corners and six-piston calipers to wipe the speed and slow down the car.'),
nl.
/* how to ask questions */
ask(Question) :-
write('Does the car have the following data:'),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question));/*the question with yes is added in working memory and the data in working memory is used later to get result from knowledge base */
assert(no(Question)),fail).
:-dynamic yes/1,no/1. /*here it ask the question dynamically sequencly one by one */
/*How to verify something using function */
verify(S):-
 (yes(S) /*if we apply yes to hypothesis then it is considered as true */
  ->
   true ;
 (no(S)
  ->
   fail ;
 ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail. /*to clear(refresh) previous data i.e.data of yes/no assertions in working memory */
undo :- retract(no(_)),fail.
undo.
