module m_predator
        use m_animal
        use m_brain

        implicit none
        private
                character, parameter :: art = 'K' 

        type, extends(animal), public :: predator
        end type

        interface predator
                module procedure no_args
                module procedure req_args
                module procedure all_args
        end interface predator

        contains
                type(predator) function no_args()
                        call no_args%set_x(1)
                        call no_args%set_y(1)
                        call no_args%set_energy(100.0)
                        call no_args%set_passive_cost(5.0)
                        
                        call no_args%set_brain(brain(art, 0.0, 0.0, 0.0, 0.0))
                end function no_args
               
                type(predator) function req_args(x, y)
                        integer, intent(in) :: x, y
                        req_args = no_args()
                        call req_args%set_x(x)
                        call req_args%set_y(y)
                end function req_args

                type(predator) function all_args(x, y, predator_val, prey_val, plant_val, stop_val)
                        integer, intent(in) :: x, y
                        real, intent(in) :: predator_val, prey_val, plant_val, stop_val
                        call all_args%set_x(x)
                        call all_args%set_y(y)
                        call all_args%set_energy(100.0)
                        call all_args%set_passive_cost(5.0)
                        
                        call all_args%set_brain(brain(art, predator_val, prey_val, plant_val, stop_val))
                end function all_args
end module m_predator
