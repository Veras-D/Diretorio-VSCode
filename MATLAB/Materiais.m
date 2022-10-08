clc; clear; close all
Codigo = input('Programa de Categorização de Ligas Ferro Carbono do Tipo 10 em Detrimento da Porcentagem de Carbono nos intervalos de 0,022% e 6,7%.\n\nDigite o Codigo da Liga? ');
T = input('Até qual temperatura a liga foi aquecida(Em °C)? ');

N1 = fix(Codigo / 10000);
N2 = fix(Codigo / 1000) - N1 * 10;
N3 = fix(Codigo / 100) - N1 * 100 - N2 * 10;
N4 = fix(Codigo / 10) - N1 * 1000 - N2 * 100 - N3 * 10;
N5 = Codigo - N1 * 10000 - N2 * 1000 - N3 * 100 - N4 * 10;

if N1 == 0 && N2 * 10 + N3 == 10
    C = (N4 * 10 + N5) / 100;
elseif N1 == 1 && N1 * 10 + N2 == 10
    C = (N3 * 100 + N4 * 10 + N5) / 100;
else
    C = 7;
end

if C < 0.77 && C > 0.022
    disp('Aço Hipoeutetoide')
elseif C == 0.77
    disp('Aço Eutetoide')
elseif C <= 2.14 && C > 0.77
    disp('Aço Hipereutetoide')
elseif C <= 6.7 && C > 2.14
    disp('Ferro Fundido')
else
    disp('Essa porcentagem não está dentro do intervalo 0,022% < %C < 6,7% ou não foi reconhecida como valida.')
end

PorcEutetica = [2.14 6.7];
TempEutetica = [1147 1147];

PorcEutetoide = [0.022 6.7];
TempEutetoide = [727 727];

PorcFerrita1 = [0 0.022];
TempFerrita1 = [0 727];

PorcFerrita2 = [0.022 0];
TempFerrita2 = [727 912];

PorcAustenita1 = [0:0.1:0.77];
TempAustenita1 = [320*(PorcAustenita1-0.77).^2+727];

PorcAustenita2 = [0.77 2.14];
TempAustenita2 = [727 1147];

PorcAustenita3 = [2.14 0.16];
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

PorcAusLiq = [0:0.1:4.30];
TempAusLiq = [188.5*(-PorcAusLiq+4.3).^0.5+1147];

PorcFe3CLiq = [4.3:0.1:6.7];
TempFe3CLiq = [77*(PorcFe3CLiq-4.3).^0.5+1147];

PC = [C C];
PT = [T 0];

plot(PorcEutetica, TempEutetica, PorcEutetoide, TempEutetoide, PorcFerrita1, TempFerrita1, PorcFerrita2, TempFerrita2, PorcAustenita1, TempAustenita1, PorcAustenita2, TempAustenita2, PorcAustenita3, TempAustenita3, PorcAustenita4, TempAustenita4, PorcPeripetica, TempPeripetica, PorcFerritaDel1, TempFerritaDel1, PorcFerritaDel2, TempFerritaDel2, PorcFerritaDel3, TempFerritaDel3, PorcAusLiq, TempAusLiq, PorcFe3CLiq, TempFe3CLiq, PC, PT, 'k--o' )
title('Diagrama Fe-C')
xlabel('Porcentagem de Carbono')
ylabel('Temperatura(°C)')
