clc; clear; close all
fprintf('Programa de Categorização de Ligas em Detrimento da Porcentagem de Carbono nos intervalos de 0,022% e 6,7%.\n\n')
C = input('Qual a Porcentagem de Carbono da Liga? ');
if C < 0.77 && C > 0.022
    disp('Aço Hipoeutetoide')
elseif C == 0.77
    disp('Aço Eutetoide')
elseif C <= 2.14 && C > 0.77
    disp('Aço Hipereutetoide')
elseif C <= 6.7 && C > 2.14
    disp('Ferro Fundido')
else
    disp('Essa porcentagem não está dentro do intervalo 0,022% < %C < 6,7% ou não foi reconhecida.')
end

PorcEutetica = [2.14 6.7];
TempEutetica = [1147 1147];

PorcEutetica = [0.022 6.7];
TempEutetoide = [727 727];

PorcFerrita1 = [0 0.022];
TempFerrita1 = [0 727];

PorcFerrita2 = [0.022 0;]
TempFerrita2 = [727 912];

PorcAustenita1 = [0:0.1:0.77];
TempAustenita1 = [320*(PorcAustenita1-0.76)^2+727];

PorcAustenita2 = [0.77 2.14];
TempAustenita2 = [727 1147];

PorcAustenita3 = [2.14 0.16];
TempAustenita3 = [1147 1493];

PorcAustenita4 = [0.16 0];
TempAustenita4 = [1493 1394];

PorcPeripetica = [0.1 0.51];
TempPeripetica = [1493 1493];

PorcFerritaDel1 = [0 0.1];
TempFerritaDel1 = [1534 1496];

PorcFerritaDel2 = [0.1 0];
TempFerritaDel2 = [1493 1394];

PorcFerritaDel3 = [0 0.16];
TempFerritaDel3 = [1394 1493];

PorcAusLiq = [0:0.1:4.30];
TempAusLiq = [188.5*(-PorcAusLiq+4.3)^0.5+1147];

PorcFe3CLiq = [4.3:0.1:6.7];
TempFe3CLiq = [77*(PorcFe3CLiq-4.3)^0.5+1147];
