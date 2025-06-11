Para compilar é utilizado o compilador GFORTRAN

Primeiro use esse comando: gfortran -c m_entity.f90; gfortran -c m_animal.f90; gfortran -c m_prey.f90; gfortran -c m_predator.f90; gfortran -c m_plant.f90; gfortran -c m_environment.f90; gfortran -c m_brain.f90;  
Depois esse: gfortran main.f90 m_prey.o m_animal.o m_predator.o m_plant.o m_entity.o m_environment.o m_brain.o -o main  

E então execute o main
