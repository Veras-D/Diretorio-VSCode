%Pedir força decomposta
%Calcular momentos primeiro 
%MRa gera momento em B e MRb gera momento em A

%EDUARDO
CordA_B = [0 0 0; 0 0 0];
syms Num R1 R2 Ay Ax By Bx Ma Mb
A = [Ax Ay 0]
B = [Bx By 0]
while Num ~= 1 & Num ~= 2
    Num = input('Qual o número de componentes de apoio (Máximo 2)? ');
    switch Num 
        case 1 
            CordA_B(1,1) = input('Insira o valor da coordenada X do componente de reação A: ');
            CordA_B(1,2) = input('Insira o valor da coordenada Y do componente de reação A: ');
            By = 0;
            Bx = 0;
            Mb = 0;
            %VEM DO CÓDIGO DO DANIEL
            CordF_M = [0 0 0];
            F = [X Y 0];
            F(1,1)
            F(1,2)
            M (momento) <----------------------------------------
            %VEM DO CÓDIGO DO DANIEL
            Rfa = CordF_M - CordA_B(1,:);
        case 2
            while CordA_B(1,1) == CordA_B(2,1) && CordA_B(1,2) == CordA_B(2,2)
                CordA_B(1,1) = input('Insira o valor da coordenada X do componente de reação A: ');
                CordA_B(1,2) = input('Insira o valor da coordenada Y do componente de reação A: ');
                CordA_B(2,1) = input('Insira o valor da coordenada X do componente de reação B: ');
                CordA_B(2,2) = input('Insira o valor da coordenada Y do componente de reação B: ');
                %VEM DO CÓDIGO DO DANIEL
                CordF_M = [0 0 0];
                F = [X Y 0];
                F(1,1)
                F(1,2)
                M (momento) <----------------------------------------
                %VEM DO CÓDIGO DO DANIEL
                Rab = CordA_B(1,:) - CordA_B(2,:);
                Rba = CordA_B(2,:) - CordA_B(1,:);
                Rfa = CordF_M - CordA_B(1,:);
                Rfb = CordF_M - CordA_B(1,:);
                    if CordA_B(1,1) == CordA_B(2,1) && CordA_B(1,2) == CordA_B(2,2)
                        disp('A e B precisão ter coordenadas distintas')
                    else
                        fprintf('\n')
                    end
            end
        otherwise 
            disp('Escolha uma opção válida')
    end
end
%EDUARDO

%TALVEZ SAIA
An = atand(abs(VR(1,2)/VR(1,1)));
VC = [F * cosd(An), F * sind(An), 0];
%TALVEZ SAIA

%TALVEZ SAIA
DH = input('Determine a distancia horizontal entre a força e o apoio (Em metros): ');
DV = input('Determine a distancia vertical entre a força e o apoio (Em metros): ');
%TALVEZ SAIA

while R~=1 && R~=2 && R ~=3
    R1 = input('Escolha o tipo de apoio em A:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste');
    switch R1
        case 1
            while R2~=1 && R2~=2 && R2~=3 && R2~=4
                R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch R2
                    case 1
                        Ax = 0;
                        Bx = 0;
                        SFy = Ay + By + F(1,2) == 0;

                        SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M == 0;
                        SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M == 0;

                        [Ay By] = solve([SFy SMa SMb], [Ay By]);
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
                        Mb??? <-------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 4
                       Eq1 = Ay + F * sind(An) == 0;
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        case 2
            while R2~=1 && R2~=2 && R2~=3 && R2~=4
                R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
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
                        Mb??? <-----------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 4
                        Eq1 = Ay + F * sind(An) == 0;
                        Eq2 = Ax + F * cosd(An) == 0;
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        case 3
            while R2~=1 && R2~=2 && R2~=3 && R2~=4
                R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch R2
                    case 1
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Ax + F * cosd(An) == 0;
                        Ma??? <------------------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 2
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Ax + Bx + F * cosd(An) == 0;
                        Ma??? <------------------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 3
                        Eq1 = Ay + By + F * sind(An) == 0;
                        Eq2 = Ax + Bx + F * cosd(An) == 0;
                        Ma??? <------------------------------------------------------------------------
                        Mb??? <------------------------------------------------------------------------
                        M(a) = 0;
                        M(b) = 0;
                    case 4
                        Eq1 = Ay + F * sind(An) == 0;
                        Eq2 = Ax + F * cosd(An) == 0;
                        M(a) = 0;
                        M(b) = 0;
                        Ma??? <---------------------------------------------------------------------
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        otherwise
            disp('Escolha uma opção válida')
    end
end
