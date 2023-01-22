clc; clear;
fprintf('Programa para calcular reações de até dois apoios num plano bidimensional, para \numa quantidade indefinida de forças e momentos, todos os valores devem ser \nexpressos no SI. São adotados como referência a direção Y do campo \ngravitacional como negativa, a direção esquerda para direita como positiva para \no eixo x e o sentido anti-horário como positivo para o momento, as hipóteses \nde reações estarão sempre apontando para o sentido positivo do eixo.\n\n')
X = input('Insira o valor da coordenada X do ponto de referência: ');
Y = input('Insira o valor da coordenada Y do ponto de referência: ');
CordAl = [X Y 0];
nM = -1;

while nM < 0
    nM = input('Quantos momentos atuam no sistema (N*m)? ');

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

%EDUARDO
syms Ay Ax By Bx Ma Mb 
NumR = 0;
A1 = 0;
A2 = 0;
Fx = F(1);
Fy = F(2);
Rao = zeros(1,3);
Rbo = zeros(1,3);
Rfo = zeros(1,3);
Rfa = zeros(1,3);
Rfb = zeros(1,3);
Rba = zeros(1,3);
Rab = zeros(1,3);
CordA = zeros(1,3);
CordB = zeros(1,3);

while NumR ~= 1 && NumR ~= 2
    NumR = input('Qual o número de componentes de apoio (Máximo 2)? ');

    switch NumR
        case 1
            CordA(1) = input('Insira o valor da coordenada X do componente de reação A: ');
            CordA(2) = input('Insira o valor da coordenada Y do componente de reação A: ');
            Bx = 0;
            By = 0;
            Mb = 0;
            Rfa = CordF_M - CordA;
        case 2

            while CordA(1) == CordB(1) && CordA(2) == CordB(2)
                CordA(1) = input('Insira o valor da coordenada X do componente de reação A: ');
                CordA(2) = input('Insira o valor da coordenada Y do componente de reação A: ');
                CordB(1) = input('Insira o valor da coordenada X do componente de reação B: ');
                CordB(2) = input('Insira o valor da coordenada Y do componente de reação B: ');
                Rab = CordA - CordB;
                Rabx = Rab(1);
                Raby = Rab(2);
                Rba = CordB - CordA;
                Rbax = Rba(1);
                Rbay = Rba(2);
                Rfa = CordF_M - CordA;
                Rfax = Rfa(1);
                Rfay = Rfa(2);
                Rfb = CordF_M - CordB;
                Rfbx = Rfb(1);
                Rfby = Rfb(2);

                if CordA(1) == CordB(1) && CordA(2) == CordB(2)
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
while A1 ~= 1 && A1 ~= 2 && A1 ~= 3
    A1 = input('Escolha o tipo de apoio em A:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste');

    switch A1
        case 1

            while A2 ~= 1 && A2 ~= 2 && A2 ~= 3 && A2 ~= 4 || NumR + 3 == A2
                A2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');

                switch A2
                    case 1
                        Ma = 0;
                        Mb = 0;
                        Ax = 0;
                        Bx = 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        [Ay, By] = solve([SFy SMa SMb], [Ay By]);
                        Ay = double(Ay);
                        By = double(By);
                        fprintf('Rolete A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nRolete B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 2
                        Ma = 0;
                        Mb = 0;
                        Ax = 0;
                        SFx = Bx + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        [Ay, Bx, By] = solve([SFx SFy SMa SMb], [Ay Bx By]);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        fprintf('Rolete A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nPino B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 3
                        Ma = 0;
                        Ax = 0;
                        SFx = Bx + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        [Ay, Bx, By, Mb] = solve([SFx SFy SMa SMb], [Ay Bx By Mb]);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Mb = double(Mb);
                        fprintf('Rolete A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nEngaste B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 4

                        if NumR == 1
                            Ax = 0;
                            Ma = 0;
                            Ay = -Fy;
                            fprintf('Rolete A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m', Ax, Ay, Ma)
                        else
                            disp('Escolha uma opção válida')
                        end

                    otherwise
                        disp('Escolha uma opção válida')
                end

            end

        case 2

            while A2 ~= 1 && A2 ~= 2 && A2 ~= 3 && A2 ~= 4 || NumR + 3 == A2
                A2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');

                switch A2
                    case 1
                        Ma = 0;
                        Mb = 0;
                        Bx = 0;
                        SFx = Ax + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        [Ax, Ay, By] = solve([SFx SFy SMa SMb], [Ax Ay By]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        By = double(By);
                        fprintf('Pino A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nRolete B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 2
                        Ma = 0;
                        Mb = 0;
                        SFx = Ax + Bx + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        [Ax, Ay, Bx, By] = solve([SFx SFy SMa SMb], [Ax Ay Bx By]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        fprintf('Pino A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nPino B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 3
                        Ma = 0;
                        SFx = Ax + Bx + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        Raf = CordA - CordF_M;
                        Rbf = CordB - CordF_M;
                        SMf = sum(cross(Raf, [Ax Ay 0])) + sum(cross(Raf, [Bx By 0])) + Mb + Ma == 0;
                        [Ax, Ay, Bx, By, Mb] = solve([SFx SFy SMa SMb SMf], [Ax Ay Bx By Mb]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Mb = double(Mb);
                        fprintf('Pino A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nEngaste B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 4

                        if NumR == 1
                            Ma = 0;
                            Ay = -Fy;
                            Ax = -Fx;
                            fprintf('Pino A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m', Ax, Ay, Ma)
                        else
                            disp('Escolha uma opção válida')
                        end

                    otherwise
                        disp('Escolha uma opção válida')
                end

            end

        case 3

            while A2 ~= 1 && A2 ~= 2 && A2 ~= 3 && A2 ~= 4 || NumR + 3 == A2
                A2 = input('Escolha o tipo de apoio em B:\n[1] - Rolete\n[2] - Pino\n[3] - Engaste\n[4] - Sem apoio em B');

                switch A2
                    case 1
                        Mb = 0;
                        Bx = 0;
                        SFx = Ax + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        [Ax, Ay, By, Ma] = solve([SFx SFy SMa SMb], [Ax Ay By Ma]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        By = double(By);
                        Ma = double(Ma);
                        fprintf('Engaste A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nRolete B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 2
                        Mb = 0;
                        SFx = Ax + Bx + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + Mb == 0;
                        else
                            SMa = sum(cross(Rfa, F)) + sum(cross(Rba, [Bx By 0])) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + Ma == 0;
                        else
                            SMb = sum(cross(Rfb, F)) + sum(cross(Rab, [Ax Ay 0])) + M + Ma == 0;
                        end

                        Raf = CordA - CordF_M;
                        Rbf = CordB - CordF_M;
                        SMf = sum(cross(Raf, [Ax Ay 0])) + sum(cross(Raf, [Bx By 0])) + Ma + Mb == 0;
                        [Ax, Ay, Bx, By, Ma] = solve([SFx SFy SMa SMb SMf], [Ax Ay Bx By Ma]);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Ma = double(Ma);
                        fprintf('Engaste A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nPino B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 3
                        SFx = Ax + Bx + Fx == 0;
                        SFy = Ay + By + Fy == 0;

                        if sum(Rfa) == 0
                            SMa = (Fy * Rfax) - (Fx * Rfay) + (By * Rbax) - (Bx * Rbay)  + Mb == 0;
                        else
                            SMa = (Fy * Rfax) - (Fx * Rfay) + (By * Rbax) - (Bx * Rbay) + M + Mb == 0;
                        end

                        if sum(Rfb) == 0
                            SMb = (Fy * Rfbx) - (Fx * Rfby) + (Ay * Rabx) - (Ax * Raby) + Ma == 0;
                        else
                            SMb = (Fy * Rfbx) - (Fx * Rfby) + (Ay * Rabx) - (Ax * Raby) + M + Ma == 0;
                        end

                        Raf = CordA - CordF_M;
                        Rafx = Raf(1);
                        Rafy = Raf(2);
                        Rbf = CordB - CordF_M;
                        Rbfx = Rbf(1);
                        Rbfy = Rbf(2);

                        SMf = (Ay * Rafx) - (Ax * Rafy) + (By * Rbfx) - (Bx * Rbfy) + Ma + Mb == 0;
                        
                        while sum(Rao) == 0 || sum(Rbo) == 0 || sum(Rfo) == 0
                            Cord_O = [0 0 0];
                            Cord_O(1) = input('Insira um novo valor da coordenada X para um ponto O: ');
                            Cord_O(2) = input('Insira um novo valor da coordenada Y para um ponto O: ');
                            Rao = CordA - Cord_O;
                            Raox = Rao(1);
                            Raoy = Rao(2);
                            Rbo = CordB - Cord_O;
                            Rbox = Rbo(1);
                            Rboy = Rbo(2);
                            Rfo = CordF_M - Cord_O;
                            Rfox = Rfo(1);
                            Rfoy = Rfo(2);

                            if sum(Rao) == 0 || sum(Rbo) == 0 || sum(Rfo) == 0
                                disp('A nova coordenada precisa ser diferente das demais')
                            else
                                fprintf('\n')
                            end

                        end

                        SMo = (Ay * Raox) - (Ax * Raoy) + (By * Rbox) - (Bx * Rboy) + (Fy * Rfox) - (Fx * Rfoy) + Ma + Mb + M == 0;
                        var = [Ax Ay Bx By Ma Mb];
                        eqs = [SFx SFy SMa SMb SMf SMo];
                        [Ax, Ay, Ma, Bx, By, Mb] = solve(eqs, var);
                        Ax = double(Ax);
                        Ay = double(Ay);
                        Bx = double(Bx);
                        By = double(By);
                        Ma = double(Ma);
                        Mb = double(Mb);
                        fprintf('Engaste A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m\nEngaste B:\n\tBx = %.2f N\n\tBy = %.2f N\n\tMb = %.2f N*m', Ax, Ay, Ma, Bx, By, Mb)
                    case 4

                        if NumR == 1
                            Ay = -Fy;
                            Ax = -Fx;
                            Ma = sum(cross(Rfa, F)) + M;
                            fprintf('Engaste A:\n\tAx = %.2f N\n\tAy = %.2f N\n\tMa = %.2f N*m', Ax, Ay, Ma)
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
    MS = zeros(1, nM);

    for contM = 1:nM
        fprintf('Qual o %d° momento do sistema? ', contM)
        MS(contM) = input('');
    end

    FC = zeros(nF, 4);

    for lin = 1:nF

        for col = 1:4

            if col == 1
                fprintf('Digite o %d° valor de Fx: ', lin)
            elseif col == 2
                fprintf('Digite o %d° valor de Fy: ', lin)
            elseif col == 3
                fprintf('Digite o %d° valor da coordenada X da força: ', lin)
            elseif col == 4
                fprintf('Digite o %d° valor da coordenada Y da força: ', lin)
            end

            FC(lin, col) = input('');
        end

    end

    F = [sum(FC(:, 1)) sum(FC(:, 2)) 0];
    Rmat = [FC(:, 3:4) zeros(nF, 1)];
    RmatA = zeros(nF, 3);

    for C = 1:nF
        RmatA(C, 1:3) = Rmat(C, 1:3) - CordAl;
    end

    Fmat = [FC(:, 1:2) zeros(nF, 1)];

    for E = 1:nF
        MP = sum(cross(RmatA(E, :), Fmat(E, :)));

        if E == 1
            MP1 = MP;
        elseif E > 1
            MP1 = MP1 + MP;
        end

    end

    M = MP1 + sum(MS);

    if M / F(2) == 0
        CordF_M = [0 M / F(1) 0] + CordAl;
    else
        CordF_M = [M / F(2) 0 0] + CordAl;
    end

end
