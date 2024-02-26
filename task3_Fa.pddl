(define (problem task3_Fa) (:domain bubble_tea_machine_task3)
(:objects 
    
)

(:init
    (for_init) 
    ; Because empty initial state is not allowed by the parser of planning.domains,
    ; I add an extra predicate that doesn't affect the planning process.
)

(:goal (and
    (mixed)
    (tea_added)
    (added mango_tapioca)
    (added mango_syrup)
    (tapioca_in_cup1)
    (heated mango_tapioca)
    (not (cup_iced cup1))
    (not (tea_heated))
    (not (heated mango_syrup))
    (not (cup_heated cup1))
))

)
