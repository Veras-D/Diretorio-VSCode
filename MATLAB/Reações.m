R = input('Escolha o tipo de apoio:\n1 - Rolete\n2 - Pino\n3 - Engaste');
A = input('Digite o angulo formado entre a força de apoio e o eixo X (Em graus): ');
F = input('Insira o modulo da força (Em Newtons): ');
M = input('Digite o momento associado a força (Em N*m): ');
VR = [0 0 0];
VR(1,1) = input('Insira o valor de X do vetor posição: ');
VR(1,2) = input('Insira o valor de Y do vetor posição: ');
An = atand(abs(VR(1,2)/VR(1,1)));
VC = [F * cosd(An), F * sind(An), 0]
DH = input('Determine a distancia horizontal entre a força e o apoio (Em metros): ');
DV = input('Determine a distancia vertical entre a força e o apoio (Em metros): ');
Mr = PV(VR, VC)
while R~=1 && R~=2 && R ~=3
    switch R
        case 1
            Ay = -F * sind(An)
            %falar direção e sentido também
        case 2
            Ay = -F * sind(An)
            Ax = -F * cosd(An)
        case 3
            Ay = -F * sind(An)
            Ax = -F * cosd(An)
            Mr = -M -Mr
        otherwise
            disp('Escolha uma opção valida')
    end
end
