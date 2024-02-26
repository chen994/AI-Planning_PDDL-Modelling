(define (domain bubble_tea_machine_task2)

;remove requirements that are not needed
(:requirements 
    :strips :typing :conditional-effects )


    (:types
        tapioca syrup - ingredient
    )

    (:constants
        mango_tapioca lime_tapioca - tapioca
        mango_syrup lime_syrup - syrup
    )

    (:predicates
        (for_init) ;A dummpy predicate becasue empty init is not allowed.
        (mixed)
        (cup_iced)
        (tea_added)
        (tea_heated)
        (tea_iced)
        (tapioca_added)
        (syrup_added)
        (added ?thing - ingredient)
        (iced ?thing - ingredient)
        (heated ?thing - ingredient)
        
    )

    ;define actions here
    (:action add_tapioca
        :parameters (?thing - tapioca)
        :precondition (and
            (not (tapioca_added))
        )
        :effect (and 
            (added ?thing)
            (tapioca_added)
            (when (cup_iced) (iced ?thing))
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
            (when (cup_iced) (iced ?thing))
        )
    )

    (:action add_tea
        :parameters ()
        :precondition (and 
            (not (tea_added))
        )
        :effect (and 
            (tea_added)
            (when (cup_iced) (tea_iced))
        )
    )
    
    (:action ice_it
        :parameters (?y - syrup)
        :precondition (and 
            (not (cup_iced))
        )
        :effect (and 
            (cup_iced)
            (when (and (tea_added) (not (tea_heated)))
                (tea_iced))
            (when (and (added ?y) (not (heated ?y)))
                (iced ?y))
            (when (and (tea_added) (tea_heated))
                (not (tea_heated)))
            (when (and (added ?y) (heated ?y))
                (not (heated ?y)))
            ;Here I assume that putting ice in the cup doesn't make heated tapioca back into unheated,
            ;or, the formula A in task 2 is impossible.
        )
    )

    (:action heat
        :parameters (?x - tapioca ?y - syrup)
        :precondition (and )
        :effect (and 
            (when (and (tea_added) (not (tea_iced)))
                (tea_heated))
            (when (and (added ?y) (not (iced ?y)))
                (heated ?y))
            (when (and (tea_added) (tea_iced))
                (not (tea_iced)))
            (when (and (added ?y) (iced ?y))
                (not (iced ?y)))
            (when (added ?x) (heated ?x))
        )
    )

    (:action mix
        :parameters ()
        :precondition (and 
            (tea_added)
            (syrup_added)
        )
        :effect (and 
            (mixed)
            (when (added mango_tapioca) 
                (and 
                    (not (added mango_tapioca))
                    (added mango_syrup)
                ))
            (when (added lime_tapioca)
                (and 
                    (not (added lime_tapioca))
                    (added lime_syrup)
                )
            )
        )
    )
)