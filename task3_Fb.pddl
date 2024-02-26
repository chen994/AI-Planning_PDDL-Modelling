(define (problem task3_Fb) (:domain bubble_tea_machine_task3)
(:objects 
)

(:init
    (for_init)
)

(:goal (and
    (not (added mango_tapioca))
    (not (added lime_tapioca))
    (added mango_syrup)
    (not (heated mango_syrup))
    (added lime_syrup)
    (heated lime_syrup)
    (cup_iced cup1)
    (not (cup_heated cup1)))
)

)
