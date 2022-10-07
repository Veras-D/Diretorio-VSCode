clc; clear; close all
fprintf('Programa de Categorização de Ligas em Detrimento da Porcentagem de Carbono nos intervalos de 0,022 e 6,7.\n\n')
C = input('Qual a Porcentagem de Carbono da Liga? ');
if C < 0.77 && C > 0.022
    disp('Aço Hipoeutetoide')
elseif C == 0.77
    disp('Aço Eutetoide')
elseif C <= 2.11 && C > 0.77
    disp('Aço Hipereutetoide')
elseif C <= 6.7 && C > 2.11
    disp('Ferro Fundido')
else
    disp('Essa porcentagem não está dentro do intervalo 0,022 < %C < 6,7 ou não foi reconhecida.')
end
