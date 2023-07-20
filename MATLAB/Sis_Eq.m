function [F, M, CordF_M] = Sis_Eq(nF, nM, CordAl)
    %[F, M, CordF_M] = Sis_Eq(nF, nM, CordAl)
    %Essa função calcula a força e o momento equivalente 
    %de um numero de forças determinado pelo usuário.
    %
    %Input's:
    %       nF      --> Numero de forças atuando no sistema (Numero)
    %       nM      --> Numero de momentos atuando no sistema (Numero)
    %       CordAl  --> Coordenadas de um ponto aleatório no plano bidimensional (Vetor)
    %
    %Output´s:
    %       F       --> Vetor força resultante do sistema (Vetor)
    %       M       --> Momento resultante do sistema (Numero)
    %       CordF_M --> Coordenadas de aplicação da força e do momento equivalentes (Vetor)
    if ~isnumeric(nF) || ~isnumeric(nM) || ~isnumeric(CordAl)
        help Sis_Eq
        error('nM deve ser um número')
    end
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