module m_plant
        use m_entity
        implicit none
        private

        public :: plant

        type, extends(entity), public :: plant
                private
                        real :: spread_chance
                contains 
                        procedure :: get_spread_chance
                        procedure :: set_spread_chance
        end type plant

        interface plant
                module procedure no_args
                module procedure req_args
        end interface plant

        contains
                type(plant) function no_args()
                        call no_args%set_x(1)
                        call no_args%set_y(1)
                        call no_args%set_spread_chance(0.10)
                end function no_args
                
                type(plant) function req_args(x, y) 
                        integer, intent(in) :: x, y
                        req_args = no_args()
                        call req_args%set_x(x)
                        call req_args%set_y(y)
                end function req_args

                real function get_spread_chance(self)
                        class(plant), intent(in) :: self
                        get_spread_chance = self%spread_chance
                end function get_spread_chance
                subroutine set_spread_chance(self, spread_chance)
                        class(plant), intent(out) :: self
                        real :: spread_chance
                        self%spread_chance = spread_chance
                end subroutine set_spread_chance 
end module m_plant

