(define (problem task1_Fa)

    (:domain bubble_tea_machine_task1)
    
    (:objects 
        mango_ball - tapioca
        mango_syrup - syrup
        papaya_syrup - syrup
    )

    (:init
        (not_iced)
        (no_tea)
        (no_tapioca)
        (no_syrup)
    )

    (:goal (and
        (added mango_ball)
        (added mango_syrup)
        (tea_added)
        (iced)
        
        )
    )
)
