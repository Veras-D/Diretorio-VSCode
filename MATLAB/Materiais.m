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
TempEutetica = [1147 1147]
PorcEutetica = [2.14 6.7]

TempEutetoide = [727 727]
PorcEutetica = [0.022 6.7]

TempFerrita1 = [0 727]
PorcFerrita1 = [0 0.022]

TempFerrita2 = [727 912]
PorcFerrita2 = [0.022 0]

TempAustenita1 = []
PorcAustenita1 = []

TempAustenita2 = [727 1147]
PorcAustenita2 = [0.77 2.14]

TempAustenita3 = [1147 1493]
PorcAustenita3 = [2.14 0.16]

TempAustenita4 = [1493 1394]
PorcAustenita4 = [0.16 0]

TempPeripetica = [1493 1493]
PorcPeripetica = [0.1 0.51]

TempFerritaDel1 = [1534 1496]
PorcFerritaDel1 = [0 0.1]

TempFerritaDel2 = [1493 1394]
PorcFerritaDel2 = [0.1 0]

TempFerritaDel3 = [1394 1493]
PorcFerritaDel3 = [0 0.16]
