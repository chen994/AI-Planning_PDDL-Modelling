# AI-Planning_PDDL-Modelling

This repository replicates my work in an assignment worth 10% of marks from the subject AI Planning for Autonomy in the Master of Information Technology course. The work aims to demonstrate my understanding of PDDL modeling. All source code is completely written by myself.

## Problem Description

**A robot that makes bubble tea**: the owner of the company that owns the robot prefers customers can flexibly specify their bubble teas.

The robot is capable of 3 things: (1) add ingredients to a cup; (2) mix the ingredients that are in the cup; (3) heat the ingredients that are in the cup.

There are 4 types of ingredients: (1) tapioca balls; (2) syrup; (3) ice; (4) tea. The model should be able to add any of these ingredients to the cup at any point. Syrup and tapioca balls can have different flavors.

Some parts of the description above can be ambiguous and could be handled flexibly. But some rules should be noted: 
1. Customers can specify whether they would like their drink mixed or not. If the tea and syrup are mixed, the drink is considered to be "mixed". However, if the tapioca balls are mixed, the mixer blends them into syrup, so there are no longer tapioca balls in the drink.
2. Customers can specify whether they would like the tea or the syrup iced. When ice is added to the cup, the drink is considered to be "iced".
3. Customers can specify whether they would like the drink to be heated. The cup can be heated in a microwave. Typically, customers like heated tapioca balls. If the ice is heated, it melts so the drink is no longer iced.
4. The robot can make just one bubble tea at a time.

#### Task 1
Model PDDL actions for adding the ingredients into a drink. Only one of each ingredient can be added to a single drink.

Once the actions are modeled, specify and test the following tasks:
* (a) A customer *can* create an iced drink with tea, mango tapioca balls, and mango syrup.
* (b) A customer *cannot* create an iced drink with tea, ice, and two different flavors of syrup.

[Domain_task1.PDDL](domain_task1.PDDL) specifies the Domain and [task1_Fa.PDDL](task1_Fa.PDDL) [task1_Fb.PDDL](task1_Fb.PDDL) specifies the Problem (a) and (b).

#### Task 2
Model heating the cup in the microwave, and mixing the ingredients of the cup.

Once the actions are modeled, specify and test the following tasks:
* (a) A customer can create a mixed drink with unheated tea, heated mango tapioca balls, unheated mango syrup, and no ice.
* (b) A customer can create a mixed drink with no tapioca balls, unheated mango syrup, unheated lime syrup, and ice. (Rule 4 in Problem Description enables 2 syrups in one drink).

[Domain_task2.PDDL](domain_task2.PDDL) specifies the Domain and [task2_Fa.PDDL](task2_Fa.PDDL) [task2_Fb.PDDL](task2_Fb.PDDL) specifies the Problem (a) and (b).

#### Task 3
The owners developing the robot have noticed that if the cup is heated in the microwave, the cup becomes too hot to handle. Fortunately, they have just upgraded the robot so that it can use two cups at a time.

Create a new version of the model so that it can operate two cups for one drink.
The new model should have the same actions as before, but this time, the actions apply to one of the cups. When heated in the microwave, the cup should be noted as being hot. In addition, the robot can tip all ingredients from one cup into the other, between either cup.

Once the actions are modeled, specify and test the following tasks:
* (a) A customer can create a mixed drink with unheated tea, heated mango tapioca balls, unheated mango syrup, no ice, and an unheated cup. This is the same as Task 2a but with an unheated cup.
* (b) A customer can create a mixed drink with no tapioca balls, unheated mango syrup, heated lime syrup, ice, and an unheated cup. This is the same as Task 2b, but with an unheated cup and with heated lime syrup.

[Domain_task3.PDDL](domain_task3.PDDL) specifies the Domain and [task3_Fa.PDDL](task3_Fa.PDDL) [task3_Fb.PDDL](task3_Fb.PDDL) specifies the Problem (a) and (b).



