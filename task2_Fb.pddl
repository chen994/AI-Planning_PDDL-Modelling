(define (problem task2_Fb) (:domain bubble_tea_machine_task2)
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
    (not (heated lime_syrup))
    (cup_iced)
))

)
