clc; clear;
X = input('Insira o valor da coordenada X do ponto de referenciá: ');
Y = input('Insira o valor da coordenada Y do ponto de referenciá: ');
CordAl = [X Y 0];
nM = -1;
while nM < 0
    nM = input('Quantas momentos atuam no sistema (N/m)? ');
    if nM < 0
        disp('Este valor não deve ser negativo')
    end
end
nF = -1;
while nF < 0
    nF = input('Quantas forças atuam no sistema (N)? ');
    if nF < 0
        disp('Este valor não deve ser negativo')
    end
end
[F, M, CordF_M] = Sis_Eq(nF, nM, CordAl);
disp(F)
disp(M)
disp(CordF_M)
%EDUARDO
CordA_B = [0 0 0; 0 0 0];
syms NumR A1 A2 Ay Ax By Bx Ma Mb Rao Rbo Rfo
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
            Rfa = CordF_M - CordA_B(1,:);
        case 2
            while CordA_B(1,1) == CordA_B(2,1) && CordA_B(1,2) == CordA_B(2,2)
                CordA_B(1,1) = input('Insira o valor da coordenada X do componente de reação A: ');
                CordA_B(1,2) = input('Insira o valor da coordenada Y do componente de reação A: ');
                CordA_B(2,1) = input('Insira o valor da coordenada X do componente de reação B: ');
                CordA_B(2,2) = input('Insira o valor da coordenada Y do componente de reação B: ');
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
while A1~=1 && A1~=2 && A1~=3
    A1 = input('Escolha o tipo de apoio em A:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste');
    switch A1
        case 1
            while A2~=1 && A2~=2 && A2~=3 && A2~=4 || NumR + 3 == A2
                A2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch A2
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
                        [Ay, By] = solve([SFy SMa SMb], [Ay By]);
                        Ay = double(Ay);
                        By = double(By);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
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
                        [Ay, Bx, By] = solve([SFx SFy SMa SMb], [Ay Bx By]);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
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
                        [Ay, Bx, By, Mb] = solve([SFx SFy SMa SMb], [Ay Bx By Mb]);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Mb = double(Mb);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
                    case 4
                        if NumR == 1 
                            Ax = 0;
                            Ma = 0;   
                            Ay = -F(1,2);
                            fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f', Ax, Ay, Ma)
                        else
                            disp('Escolha uma opção válida')
                        end
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        case 2
            while A2~=1 && A2~=2 && A2~=3 && A2~=4 || NumR + 3 == A2
                A2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch A2
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
                        [Ax, Ay, By] = solve([SFx SFy SMa SMb], [Ax Ay By]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        By = double(By);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
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
                        [Ax, Ay, Bx, By] = solve([SFx SFy SMa SMb], [Ax Ay Bx By]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
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
                        [Ax, Ay, Bx, By, Mb] = solve([SFx SFy SMa SMb SMf], [Ax Ay Bx By Mb]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Mb = double(Mb);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
                    case 4
                        if NumR == 1
                            Ma = 0;
                            Ay = -F(1,2);
                            Ax = -F(1,1);
                            fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f', Ax, Ay, Ma)
                        else
                            disp('Escolha uma opção válida')
                        end
                    otherwise
                        disp('Escolha uma opção válida')
                end
            end
        case 3
            while A2~=1 && A2~=2 && A2~=3 && A2~=4 || NumR + 3 == A2
                A2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');
                switch A2
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
                        [Ax, Ay, By, Ma] = solve([SFx SFy SMa SMb], [Ax Ay By Ma]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        By = double(By);
                        Ma = double(Ma);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
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
                        [Ax, Ay, Bx, By, Ma] = solve([SFx SFy SMa SMb SMf], [Ax Ay Bx By Ma]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Ma = double(Ma);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
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
                        [Ax, Ay, Bx, By, Ma, Mb] = solve([SFx SFy SMa SMb SMf SMo], [Ax Ay Bx By Ma Mb]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Ma = double(Ma);
                        Mb = double(Mb);
                        fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f\nRolete B:\n\tBx = %.2f\n\tBy = %.2f\n\tMb = %.2f', Ax, Ay, Ma, Bx, By, Mb)
                    case 4
                        if NumR == 1
                            Ay = -F(1,2);
                            Ax = -F(1,1);
                            Ma = sum(cross(Rfa,F)) + M;
                            fprintf('Rolete A:\n\tAx = %.2f\n\tAy = %.2f\n\tMa = %.2f', Ax, Ay, Ma)
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
function [F, M, CordF_M] = Sis_Eq(nF, nM, CordAl)
    %[F, M, CordF_M] = Sis_Eq(nF, nM, CordAl)
    %Essa função calcula a força e o momento equivalente 
    %de um número de forças determinado pelo usuário.
    %
    %Input's:
    %       nF      --> Número de forças atuando no sistema (Número)
    %       nM      --> Número de momentos atuando no sistema (Número)
    %       CordAl  --> Coordenadas de um ponto aleatório no plano bidimensional (Vetor)
    %
    %Output´s:
    %       F       --> Vetor força resultante do sistema (Vetor)
    %       M       --> Momento resultante do sistema (Número)
    %       CordF_M --> Coordenadas de aplicação da força e do momento equivalentes (Vetor)
    MS = zeros(1,nM);
    for contM = 1:nM
        fprintf('Qual o %d° momento do sistema? ', contM)
        MS(contM) = input('');
    end
    FC = zeros(nF,4);
    for lin = 1:nF
        for col = 1:4
            if col == 1
                fprintf('Digite o %d° valor de Fx: ',lin)
            elseif col == 2
                fprintf('Digite o %d° valor de Fy: ',lin)
            elseif col == 3
                fprintf('Digite o %d° valor da coordenada X da força: ',lin)
            elseif col == 4
                fprintf('Digite o %d° valor da coordenada Y da força: ',lin)
            end
            FC(lin,col) = input('');
        end
    end
    F = [sum(FC(:,1)) sum(FC(:,2)) 0];
    Rmat = [FC(:,3:4) zeros(nF,1)];
    RmatA = zeros(nF,3);
    for C = 1:nF
        RmatA(C,1:3) = Rmat(C,1:3) - CordAl;
    end
    Fmat = [FC(:,1:2) zeros(nF,1)];
    for E = 1:nF
        MP = sum(cross(RmatA(E,:),Fmat(E,:)));
        if E == 1    
            MP1 = MP;
        elseif E > 1
            MP1 = MP1 + MP;
        end
        M = MP1 + sum(MS);
        if M / F(2) == 0
            CordF_M = [0 M / F(1) 0] + CordAl;
        else 
            CordF_M = [M / F(2) 0 0] + CordAl;
        end
    end
end
