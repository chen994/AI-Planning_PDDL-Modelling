(define (problem task1_Fa)

    (:domain bubble_tea_machine_task1)
    
    (:objects 
        mango_syrup - syrup
        lime_syrup - syrup
    )

    (:init
        (not_iced)
        (no_tea)
        (no_tapioca)
        (no_syrup)
    )

    (:goal (and
        (added lime_syrup)
        (added mango_syrup)
        (tea_added)
        (iced)
        
        )
    )
)
