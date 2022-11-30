R1 = input('Escolha o tipo de apoio em A:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste');
%Pedir coordenadas das reações
%Pedir força decomposta
%Calcular momentos primeiro 
%MRa gera momento em B e MRb gera momento em A
%Ponto A e o Ponto B não podem ser iguais

%COORDENADAS
CordA_B = [0 0 0; 0 0 0];
CordF_M = [0 0 0; 0 0 0];
%COORDENADAS
Num = input('Qual o numero de componentes de apoio? (Máximo 2) ')
while Num ~= 1 & Num ~= 2
    switch Num 
        case 1 
            CordA_B(1,1) = input('Insira o valor da coordenada X do componente de reação A: ')
            CordA_B(1,2) = input('Insira o valor da coordenada Y do componente de reação A: ')
        case 2
            while CordAB(1,1) == CordAB(2,1) && CordAB(1,2) == CordAB(2,2)
                CordAB(1,1) = input('Insira o valor da coordenada X do componente de reação A: ')
                CordAB(1,2) = input('Insira o valor da coordenada Y do componente de reação A: ')
                CordAB(2,1) = input('Insira o valor da coordenada X do componente de reação B: ')
                CordAB(2,2) = input('Insira o valor da coordenada Y do componente de reação B: ')
                    if CordAB(1,1) == CordAB(2,1) && CordAB(1,2) == CordAB(2,2)
                        disp('A e B precisão ter coordenadas distintas')
                    else
                        disp('\n')
                    end
            end
        otherwise 
            disp('Escolha uma opção valida')
    end
end

VF = [0 0 0];

%TALVEZ SAIA
VR(1,1) = input('Insira o valor de X do vetor posição: ');
VR(1,2) = input('Insira o valor de Y do vetor posição: ');
%TALVEZ SAIA

%TALVEZ SAIA
An = atand(abs(VR(1,2)/VR(1,1)));
VC = [F * cosd(An), F * sind(An), 0]
%TALVEZ SAIA

%TALVEZ SAIA
DH = input('Determine a distancia horizontal entre a força e o apoio (Em metros): ');
DV = input('Determine a distancia vertical entre a força e o apoio (Em metros): ');
%TALVEZ SAIA

R = (VETOR DISTANCIA ENTRE A FORÇA E O PONTO A)<----------------------------------------------------------------------------------------------

Mr = PV(R, VC);

F = input('Insira o modulo da força (Em Newtons): ');
M = input('Digite o momento associado a força (Em N*m): ');
while R~=1 && R~=2 && R ~=3
    switch R1
        case 1
            R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
            while R2~=1 && R2~=2 && R2~=3 && R2~=4
                switch R2
                    case 1
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = M(a) == 0;
                        Eq3 = M(b) == 0;
                        syms Ay By
                        [Ay By] = solve([Eq1 Eq2 Eq3], [Ay By]);
                        Ay = double(Ay);
                        By = double(By);
                        fprintf('TEXTO')
                    case 2
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Bx + F * cosd(An) == 0;
                        M(a) = 0;
                        M(b) = 0;
                    case 3
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Bx + F * cosd(An) == 0;
                        MRb??? <-------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 4
                       Eq1 = Ay + F * sind(An) == 0;
                    otherwise
                        disp('Escolha uma opção valida')
                end
            end
        case 2
            R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
            while R2~=1 && R2~=2 && R2~=3 && R2~=4
                switch R2
                    case 1
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Ax + F * cosd(An) == 0;
                        M(a) = 0;
                        M(b) = 0;
                    case 2
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Rq2 = Ax + Bx + F * cosd(An) == 0;
                        M(a) = 0;
                        M(b) = 0;
                    case 3
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Rq2 = Ax + Bx + F * cosd(An) == 0;
                        MRb??? <-----------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 4
                        Eq1 = Ay + F * sind(An) == 0;
                        Eq2 = Ax + F * cosd(An) == 0;
                    otherwise
                        disp('Escolha uma opção valida')
                end
            end
        case 3
            R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
            while R2~=1 && R2~=2 && R2~=3 && R2~=4
                switch R2
                    case 1
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Ax + F * cosd(An) == 0;
                        MRa??? <------------------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 2
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Ax + Bx + F * cosd(An) == 0;
                        MRa??? <------------------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 3
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Ax + Bx + F * cosd(An) == 0;
                        MRa??? <------------------------------------------------------------------------
                        MRb??? <------------------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 4
                        Eq1 = Ay + F * sind(An) == 0;
                        Eq2 = Ax + F * cosd(An) == 0;
                        M(a) = 0;
                        M(b) = 0;
                        MRa??? <---------------------------------------------------------------------
                    otherwise
                        disp('Escolha uma opção valida')
                end
            end
        otherwise
            disp('Escolha uma opção valida')
    end
end
