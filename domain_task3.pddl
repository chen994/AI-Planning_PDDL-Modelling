(define (domain bubble_tea_machine_task3)
;In task3, I assume the extra cup, cup2, will only be used to heat tapioca balls.

(:requirements 
    :strips :typing :conditional-effects )


    (:types
        tapioca syrup - ingredient
        cup
    )

    (:constants
        mango_tapioca lime_tapioca - tapioca
        mango_syrup lime_syrup - syrup
        cup1 cup2 - cup
    )

    (:predicates
        (for_init) ;A dummpy predicate becasue empty init is not allowed.
        (mixed)
        (cup_iced ?cup - cup)
        (tapioca_in_cup1) ;This predicate indicates that content in cup2 has been tipped to cup1.
        (tea_added)
        (tea_heated)
        (tea_iced)
        (tapioca_added)
        (syrup_added)
        (added ?thing - ingredient)
        (iced ?thing - ingredient)
        (cup_heated ?cup - cup)
        (heated ?thing - ingredient)
        
    )

    (:action add_tapioca
        :parameters (?thing - tapioca)
        :precondition (and
            (not (tapioca_added))
        )
        :effect (and 
            (added ?thing)
            (tapioca_added)
            ;Here I assume that the extra cup, cup2, for tapioca doesn't need to be iced ever
            ;because customers don't like iced tapioca.
        )
    )

    (:action add_syrup
        :parameters (?thing - syrup)
        :precondition (and 
            (not (syrup_added))
        )
        :effect (and
            (added ?thing)
            (syrup_added)
            (when (cup_iced cup1) (iced ?thing))
        )
    )

    (:action add_tea
        :parameters ()
        :precondition (and 
            (not (tea_added))
        )
        :effect (and 
            (tea_added)
            (when (cup_iced cup1) (tea_iced))
        )
    )
    
    (:action ice_it 
        ;Only cup1 can be iced, because I assume cup2 is only used for process tapioca balls and tapioca balls doesn't need to be iced.
        :parameters (?y - syrup)
        :precondition (and 
            (not (cup_iced cup1))
        )
        :effect (and 
            (cup_iced cup1)
            (when (and (tea_added) (not (tea_heated)))
                (tea_iced))
            (when (and (added ?y) (not (heated ?y)))
                (iced ?y))
            (when (and (tea_added) (tea_heated))
                (not (tea_heated)))
            (when (and (added ?y) (heated ?y))
                (not (heated ?y)))
            ;Here I assume that putting ice in the cup doesn't make heated tapioca back into unheated,
            ;otherwise, the formula A in task 2 is impossible.
        )
    )

    (:action heat_cup1
        :parameters (?y - syrup)
        :precondition (and )
        :effect (and 
            (cup_heated cup1)
            (when (and (tea_added) (not (tea_iced)))
                (tea_heated))
            (when (and (added ?y) (not (iced ?y)))
                (heated ?y))
            (when (and (tea_added) (tea_iced))
                (not (tea_iced)))
            (when (and (added ?y) (iced ?y))
                (not (iced ?y)))
        )
    )
    
    (:action heat_cup2
        :parameters (?x - tapioca)
        :precondition (and )
        :effect (and 
            (cup_heated cup2)
            (when (and (not (tapioca_in_cup1)) (added ?x))
                (heated ?x))
        )
    )

    (:action tip
        :parameters ()
        :precondition (and 
            (tapioca_added)
            (not (tapioca_in_cup1))
        )
        :effect (and 
            (tapioca_in_cup1)
        )
    )

    (:action mix
        ;I assume "mix" only happens in cup1 because cup2 is only for processing tapioca balls.
        :parameters ()
        :precondition (and 
            (tea_added)
            (syrup_added)
        )
        :effect (and 
            (mixed)
            (when (and (tapioca_in_cup1) (added mango_tapioca)(heated mango_tapioca))
                (and
                    (not (added mango_tapioca))
                    (added mango_syrup)
                    (heated mango_syrup))
            )
            (when (and (tapioca_in_cup1) (added mango_tapioca))
                (and
                    (not (added mango_tapioca))
                    (added mango_syrup))
            )
            (when (and (tapioca_in_cup1) (added lime_tapioca) (heated lime_tapioca))
                (and 
                    (not (added lime_tapioca))
                    (added lime_syrup)
                    (heated lime_syrup))
            )
            (when (and (tapioca_in_cup1) (added lime_tapioca))
                (and 
                    (not (added lime_tapioca))
                    (added lime_syrup))
            )
        )
    )
    
)