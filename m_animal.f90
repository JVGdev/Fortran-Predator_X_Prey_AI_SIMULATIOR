module m_animal
        use m_entity
        use m_brain

        implicit none
        private
        type, abstract, extends(entity), public :: animal
                private 
                        real :: energy
                        real :: passive_cost
                        type(brain) :: brain
                contains 
                        procedure :: get_energy, set_energy
                        procedure :: sub_energy, add_energy, get_passive_cost, set_passive_cost
                        procedure :: think_move, set_brain, get_brain_vals, move
        end type

        contains
                
                real function get_energy(self) result(res)        
                        class(animal), intent(in) :: self     
                        res=self%energy
                end function

                subroutine sub_energy(self, cost)        
                        class(animal), intent(out) :: self      
                        real, intent(in) :: cost
                        self%energy = (self%energy - cost) 
                end subroutine
                
                subroutine add_energy(self, profit)        
                        class(animal), intent(out) :: self      
                        real, intent(in) :: profit
                        self%energy = (self%energy + profit) 
                end subroutine
                
                subroutine set_passive_cost(self, cost)        
                        class(animal), intent(out) :: self      
                        real, intent(in) :: cost
                        self%passive_cost = merge(cost, 0.0, cost > 0.0) 
                end subroutine

                real function get_passive_cost(self) result(res)       
                        class(animal), intent(in) :: self 
                             
                        res = self%passive_cost
                end function get_passive_cost
                
                subroutine set_energy(self, energy)        
                        class(animal), intent(out) :: self      
                        real, intent(in) :: energy
                        self%energy = merge(energy, 0.0, energy > 0.0)
                end subroutine
                
                subroutine set_brain(self, nbrain)        
                        class(animal), intent(out) :: self      
                        type(brain), intent(in) :: nbrain
                        self%brain = nbrain
                end subroutine
                
                function think_move(self, view, n, m, x, y)
                        class(animal), intent(inout) :: self
                        character, dimension(:,:) :: view
                        integer, intent(in) :: n, m, x , y
                        integer, dimension(2) :: think_move
                        call self%brain%next_step(view, n, m, x, y, think_move)
                end function think_move
                
                function get_brain_vals(self) result(res)
                        class(animal), intent(in) :: self
                        real, dimension(4) :: res
                        res = [self%brain%get_predator_val(), self%brain%get_prey_val(), self%brain%get_plant_val(), self%brain%get_stop_val()]
                end function get_brain_vals
                
                subroutine move(self, step)
                        class(animal), intent(inout) :: self
                        integer, dimension(2), intent(in) :: step
                        call self%set_x(step(1))
                        call self%set_y(step(2))
                        call self%sub_energy(self%get_passive_cost())
                end subroutine move
end module m_animal

