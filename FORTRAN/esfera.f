program esfera
! definindo variaveis

integer i, j, k
real, allocatable :: X(:)
real, allocatable :: U(:)
real, allocatable :: T(:)

real dt

integer npast
real k1, k2, k3, k4
real st

white(*, *) 'Qual o numero de Stokes?'
read*, st

end program esfera