clc; clear;
%EDUARDO
CordA_B = [0 0 0; 0 0 0];
syms NumR R1 R2 Ay Ax By Bx Ma Mb Rao Rbo Rfo
A = [Ax Ay 0];
B = [Bx By 0];
while NumR ~= 1 && NumR ~= 2
    NumR = input('Qual o número de componentes de apoio (Máximo 2)? ');
    switch NumR 
        case 1 
            CordA_B(1,1) = input('Insira o valor da coordenada X do componente de reação A: ');
            CordA_B(1,2) = input('Insira o valor da coordenada Y do componente de reação A: ');
            Bx = 0;
            By = 0;
            Mb = 0;
            %VEM DO CÓDIGO DO DANIEL
            CordF_M = [0 0 0];
            F = [X Y 0];
            F(1)
            F(2)
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
                Rfb = CordF_M - CordA_B(2,:);
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
while R1~=1 && R1~=2 && R1~=3
    R1 = input('Escolha o tipo de apoio em A:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste');
    switch R1
        case 1
            while R2~=1 && R2~=2 && R2~=3 && R2~=4 || NumR + 3 == R2
                R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch R2
                    case 1
                        Ma = 0;
                        Mb = 0;
                        Ax = 0;
                        Bx = 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        [Ay By] = solve([SFy SMa SMb], [Ay By]);
                        Ay = double(Ay);
                        By = double(By);
                        fprintf('TEXTO')
                    case 2
                        Ma = 0;
                        Mb = 0;
                        Ax = 0;
                        SFx = Bx + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        [Ay Bx By] = solve([SFx SFy SMa SMb], [Ay Bx By]);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        fprintf('TEXTO')
                    case 3
                        Ma = 0;
                        Ax = 0;
                        SFx = Bx + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else    
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        [Ay Bx By Mb] = solve([SFx SFy SMa SMb], [Ay Bx By Mb]);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Mb = double(Mb);
                        fprintf('TEXTO')
                    case 4
                        if NumR = 1    
                            Ay = -F(1,2);
                            fprintf('TEXTO')
                        else
                            disp('Escolha uma opção válida')
                        end
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        case 2
            while R2~=1 && R2~=2 && R2~=3 && R2~=4 || NumR + 3 == R2
                R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch R2
                    case 1
                        Ma = 0;
                        Mb = 0;
                        Bx = 0;
                        SFx = Ax + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        [Ax Ay By] = solve([SFx SFy SMa SMb], [Ax Ay By]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        By = double(By);
                        fprintf('TEXTO')
                    case 2
                        Ma = 0;
                        Mb = 0;
                        SFx = Ax + Bx + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        [Ax Ay Bx By] = solve([SFx SFy SMa SMb], [Ax Ay Bx By]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        fprintf('TEXTO')
                    case 3
                        Ma = 0;
                        SFx = Ax + Bx + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        Raf = CordA_B(1,:) - CordF_M;
                        Rbf = CordA_B(2,:) - CordF_M;
                        SMf = sum(cross(Raf,A)) + sun(cross(Raf,B)) + Mb + Ma == 0;
                        [Ax Ay Bx By Mb] = solve([SFx SFy SMa SMb SMf], [Ax Ay Bx By Mb]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Mb = double(Mb);
                        fprintf('TEXTO')
                    case 4
                        if NumR = 1
                            Ay = -F(1,2);
                            Ax = -F(1,1);
                            fprintf('TEXTO')
                        else
                            disp('Escolha uma opção válida')
                        end
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        case 3
            while R2~=1 && R2~=2 && R2~=3 && R2~=4 || NumR + 3 == R2
                R2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch R2
                    case 1
                        Mb = 0;
                        Bx = 0;
                        SFx = Ax + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        [Ax Ay By Ma] = solve([SFx SFy SMa SMb], [Ax Ay By Ma]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        By = double(By);
                        Ma = double(Ma);
                        fprintf('TEXTO')
                    case 2
                        Mb = 0;
                        SFx = Ax + Bx + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        Raf = CordA_B(1,:) - CordF_M;
                        Rbf = CordA_B(2,:) - CordF_M;
                        SMf = sum(cross(Raf,A)) + sun(cross(Raf,B)) + Ma + Mb == 0;
                        [Ax Ay Bx By Ma] = solve([SFx SFy SMa SMb SMf], [Ax Ay Bx By Ma]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Ma = double(Ma);
                        fprintf('TEXTO')
                    case 3
                        SFx = Ax + Bx + F(1,1) == 0;
                        SFy = Ay + By + F(1,2) == 0;
                        if Rfa == 0
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa,F)) + sum(cross(Rba,B)) + M + Mb == 0;
                        end
                        if Rfb == 0
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb,F)) + sum(cross(Rab,A)) + M + Ma == 0;
                        end
                        Raf = CordA_B(1,:) - CordF_M;
                        Rbf = CordA_B(2,:) - CordF_M;
                        SMf = sum(cross(Raf,A)) + sun(cross(Raf,B)) + Ma + Mb == 0;
                        while Rao == 0 || Rbo == 0 || Rfo == 0
                            Cord_O = [0 0 0];
                            Cord_O(1) = input('Insira um novo valor da coordenada X para um ponto O: ');
                            Cord_O(2) = input('Insira um novo valor da coordenada Y para um ponto O: ');
                            Rao = CordA_B(1,:) - Cord_O;
                            Rbo = CordA_B(2,:) - Cord_O;
                            Rfo = CordF_M - Cord_O;
                            if Rao == 0 || Rbo == 0 || Rfo ==0
                                disp('A nova coordenada precisa ser diferente das demais')
                            else
                                fprintf('\n')
                            end
                        end
                        SMo = sum(cross(Rao,A)) + sum(cross(Rbo,B)) + sum(cross(Sfo,F)) + Ma + Mb + M == 0;
                        [Ax Ay Bx By Ma Mb] = solve([SFx SFy SMa SMb SMf SMo], [Ax Ay Bx By Ma Mb]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Ma = double(Ma);
                        Mb = double(Mb);
                        fprintf('TEXTO')
                    case 4
                        if NumR = 1
                            Ay = -F(1,2);
                            Ax = -F(1,1);
                            Ma = sum(cross(Rfa,F)) + M;
                            fprintf('TEXTO')
                        else
                            disp('Escolha uma opção válida')
                        end
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        otherwise
            disp('Escolha uma opção válida')
    end
end
