(define (domain bubble_tea_machine_task1)

(:requirements 
    :strips :typing
)

    (:types
        tapioca syrup - ingredient
    )

    (:predicates 
        (not_iced)
        (iced)
        (no_tea)
        (tea_added)
        (no_tapioca)
        (no_syrup)
        (added ?thing - ingredient)
    )

    (:action add_tapioca
        :parameters (?thing - tapioca)
        :precondition (and
            (no_tapioca)
        )
        :effect (and 
            (added ?thing)
            (not (no_tapioca))
        )
    )

    (:action add_syrup
        :parameters (?thing - syrup)
        :precondition (and 
            (no_syrup)
        )
        :effect (and
            (added ?thing)
            (not (no_syrup))
        )
    )

    (:action add_tea
        :parameters ()
        :precondition (and 
            (no_tea)
        )
        :effect (and 
            (tea_added)
            (not (no_tea))
        )
    )
    
    (:action ice_it
        :parameters ()
        :precondition (and 
            (not (iced))
            (not_iced)
        )
        :effect (and 
            (iced)
            (not (not_iced))
        )
    )
)