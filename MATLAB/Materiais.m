E = 1;
while E == 1
    clc; clear; close all
    C = 7;
    disp('Programa de Categorização de Ligas Ferro Carbono do Tipo 10 em Detrimento da Porcentagem de Carbono nos intervalos de 0,008% e 6,67%.')

    while C == 7 || T < 400
        Codigo = input('\n\nDigite o Código da Liga? ');
        T = input('Até qual temperatura a liga foi aquecida(Em °C)? ');

        N1 = fix(Codigo / 10000);
        N2 = fix(Codigo / 1000) - N1 * 10;
        N3 = fix(Codigo / 100) - N1 * 100 - N2 * 10;
        N4 = fix(Codigo / 10) - N1 * 1000 - N2 * 100 - N3 * 10;
        N5 = Codigo - N1 * 10000 - N2 * 1000 - N3 * 100 - N4 * 10;

            if N1 == 0 && N2 * 10 + N3 == 10
                C = (N4 * 10 + N5) / 100;
                PC = [C C];
                PT = [T 0];
            elseif N1 == 1 && N1 * 10 + N2 == 10 && N3 ~= 0
                C = (N3 * 100 + N4 * 10 + N5) / 100;
                PC = [C C];
                PT = [T 0];
            else
                C = 7;
                PC = [0];
                PT = [0];
                disp('Essa porcentagem não está dentro do intervalo 0,008% < %C < 6,7% ou não foi reconhecida como válida.')
            end
        if C < 0.77
            A3 = 312 * (C - 0.77).^2 + 727;
        elseif C==0.77
            A3 = 727;
        elseif C > 0.77 && C < 2.11
            Acm = 313.433 * C + 485.66;
        elseif C >= 2.11 && C <= 6.67
            Acm = 1147;
        end
    end
    if C >= 0.008 && C < 0.022
        if T >= 727
            FP = ((0.77 - C) / (0.77)) * 100;
            P = 100 - FP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga é um Aço Hipoeutetoide, portanto é recomendado que a mistura seja aquecida até %.2f°C. A composição é de %.2f%% Ferrita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', A3, FP, P, FT, CT)
        elseif T < 727
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga não foi aquecida até a temperatura eutetoide, caso fosse aquecida até essa temperatura ou até a temperatura A3, nesse caso %.2f°C, a liga seria um Aço Hipoeutetoide com %.2f%% de Ferrita total e %.2f%% de Cementita total.', A3, FT, CT)
         end
    elseif C >= 0.022 && C < 0.77
        if T >= 727
            FP = ((0.77 - C) / (0.77 - 0.022)) * 100;
            P = 100 - FP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga é um Aço Hipoeutetoide, portanto é recomendado que a mistura seja aquecida até %.2f°C. A composição é de %.2f%% Ferrita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', A3, FP, P, FT, CT)
        elseif T < 727
            FP = ((0.77 - C) / (0.77 - 0.022)) * 100;
            P = 100 - FP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga não foi aquecida até a temperatura eutetoide, caso fosse aquecida até essa temperatura  ou até a temperatura A3, Nesse caso %.2f°C, a liga seria um Aço Hipoeutetoide com %.2f%% Ferrita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', A3, FP, P, FT, CT)
        end
    elseif C == 0.77
        if T >= 727
            P = 100;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga foi aquecida até a temperatura de %.2f°C e portanto, é um Aço Eutetoide, com %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', A3, P, FT, CT)
        elseif T < 727
            P = 100;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga não foi aquecida até a temperatura eutetoide caso fosse aquecida até 727°C ou até a temperatura A3 de %.2f°C a liga seria um Aço Eutetoide, com %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', A3, P, FT, CT)
        end
    elseif C > 0.77 && C < 2.11
        if T >= 727
            CP = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga foi aquecida até pelo menos a temperatura eutetoide, sendo recomendado o aquecimento até a temperatura Acm, nesse caso %.2f°C, e portanto é um Aço Hipereutetoide, com %.2f%% Cementita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        elseif T < 727
            CP = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga não alcançou a temperatura Eutetoide ou a Temperatura Acm caso a mistura fosse aquecida até a temperatura de pelo menos 727°C ou até a temperatura de %.2f°C a liga seria um Aço Hipereutetoide, com %.2f%% Cementita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        end
    elseif C >= 2.11 && C < 4.3
        if T >= 727
            CP = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga foi aquecida até pelo menos a temperatura eutetoide, sendo recomendado o aquecimento até a temperatura Acm, nesse caso %.2f°C, e portanto é um Ferro Fundido Hipoeutetico, com %.2f%% Cementita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        elseif T < 727
            P = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga não alcaçou a temperatura eutetoide ou a temperatura Acm caso a mistura alcançase a temperatura de 727°C ou a temperatura de %.2f°C, a liga seria é um Ferro Fundido Hipoeutetico, com %.2f%% Cementita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        end
    elseif C == 4.3
        if T >= 727
            CP = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A liga foi aquecida até pelo menos a temperatura eutetoide, sendo recomendado o aquecimento até a temperatura Acm, nesse caso %.2f°C, e portanto a mistura é um Ferro Fundido Eutetico, com %.2f%% Cementita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        elseif T < 727
            CP = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = ((6.7 - C) / (6.7)) * 100;
            CT = 100 - FT;
            fprintf('A mistura não foi aquecida o suficiente, caso fosse aquecida até a temperatura eutetoide ou até a temperatura Acm, nesse caso %.2f°C, a liga seria um Ferro Fundido Eutetico, com %.2f%% Cementita proeutetoide, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        end
    elseif C > 4.3 && C <= 6.67
        if T >= 727
            CP = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = (6.7 - C) / (6.7) * 100;
            CT = 100 - FT;
            fprintf('A liga foi aquecida até pelo menos a temperatura eutetoide, sendo recomendado o aquecimento até a temperatura Acm, nesse caso %.2f°C, e portanto é um Ferro Fundido Hipereutetico, com %.2f%% Cementita primaria, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        elseif T < 727
            CP = ((C - 0.77) / (6.7 - 0.77)) * 100;
            P = 100 - CP;
            FT = (6.7 - C) / (6.7) * 100;
            CT = 100 - FT;
            fprintf('A mistura não foi aquecida o suficiente, caso fosse aquecida até a temperatura eutetoide ou até a temperatura Acm, nesse caso %.2f°C, a liga seria um Ferro Fundido Hipereutetico, com %.2f%% Cementita primaria, %.2f%% de Perlita, %.2f%% de Ferrita total e %.2f%% de Cementita total.', Acm, CP, P, FT, CT)
        end
    else
        disp('Essa porcentagem não está dentro do intervalo 0,008% < %C < 6,7% ou não foi reconhecida como válida.')
    end

    PorcEutetica = [2.11 7];
    TempEutetica = [1147 1147];

    PorcEutetoide = [0.022 7];
    TempEutetoide = [727 727];

    PorcFerrita1 = [0 0.022];
    TempFerrita1 = [0 727];

    PorcFerrita2 = [0.022 0];
    TempFerrita2 = [727 912];

    PorcAustenita1 = [0:0.1:0.77];
    TempAustenita1 = [312 * (PorcAustenita1 - 0.77).^2 + 727];

    PorcAustenita2 = [0.77 2.11];
    TempAustenita2 = [727 1147];

    PorcAustenita3 = [2.11 0.16];
    TempAustenita3 = [1147 1515];

    PorcAustenita4 = [0.16 0];
    TempAustenita4 = [1515 1394];

    PorcPeripetica = [0.1 0.494];
    TempPeripetica = [1515 1515];

    PorcFerritaDel1 = [0 0.1];
    TempFerritaDel1 = [1538 1515];

    PorcFerritaDel2 = [0.1 0];
    TempFerritaDel2 = [1515 1394];

    PorcFerritaDel3 = [0 0.16];
    TempFerritaDel3 = [1394 1515];

    PorcAusLiq = [0:0.1:4.3];
    TempAusLiq = [188.56 * (-PorcAusLiq + 4.3).^0.5 + 1147];

    PorcFe3CLiq = [4.3:0.1:7];
    TempFe3CLiq = [53.9 * (PorcFe3CLiq - 4.3).^0.5 + 1147];

    PorcFe3C = [6.67 6.67];
    TempFe3C = [0 1230];

    plot(PorcEutetica, TempEutetica, PorcEutetoide, TempEutetoide, PorcFerrita1, TempFerrita1, PorcFerrita2, TempFerrita2, PorcAustenita1, TempAustenita1, PorcAustenita2, TempAustenita2, PorcAustenita3, TempAustenita3, PorcAustenita4, TempAustenita4, PorcPeripetica, TempPeripetica, PorcFerritaDel1, TempFerritaDel1, PorcFerritaDel2, TempFerritaDel2, PorcFerritaDel3, TempFerritaDel3, PorcAusLiq, TempAusLiq, PorcFe3CLiq, TempFe3CLiq, PorcFe3C, TempFe3C, PC, PT, 'k--o')
    title('Diagrama Fe-C')
    xlabel('Coposição(%C)')
    ylabel('Temperatura(°C)')
    grid on
    xlim([0 7])
    ylim([400 1600])
    yticks(0:400:1600)
    Aust = text(0.7, 1100, 'γ', 'FontSize', 10);
    Fert = text(-0.8, 700, 'α-->', 'FontSize', 10);
    Perl = text(3, 600, 'P', 'FontSize', 10);
    Fe3C = text(5.3, 600, 'Fe3C-->', 'FontSize', 10);
    FDel = text(-0.8, 1500, 'δ-->', 'FontSize', 10);
    Liqu = text(4.3, 1300, 'L', 'FontSize', 10);
    FAus = text(-0.9, 770, 'α+γ->', 'FontSize', 9);
    LAus = text(2.5, 1250, 'γ+L', 'FontSize', 10);
    LCem = text(5.7, 1200, 'L+Fe3C', 'FontSize', 9);
    CAus = text(3, 1000, 'γ+Fe3C', 'FontSize', 9);
    E = input('\nDeseja consultar outra liga?\nSim = 1\nNão = Qualquer outro número\n');
end
