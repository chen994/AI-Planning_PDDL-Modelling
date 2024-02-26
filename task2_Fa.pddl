(define (problem task2_Fa) (:domain bubble_tea_machine_task2)
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
    (not (tea_heated))
    (added mango_tapioca)
    (added mango_syrup)
    (heated mango_tapioca)
    (not (heated mango_syrup))
))

)
