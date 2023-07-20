clc; clear; 
c = 0;
while c > 3 || c < 1
    c = input('digite a quantidade de coeficientes de dilatação: '); 
end
co = zeros(1,c);
tem = zeros(1,c);
b = zeros(1,c);
for cont = 1:c 
    fprintf('digite o valor do coeficiente %d:\n ', cont); 
    co(cont) = input('valor da constante: '); 
end 
disp(['valores das contantes: ',num2str(co)]) 
for cont=1:c 
    fprintf('digite o valor da temperatura %d:\n ',cont); 
    tem(cont)= input('valor da temperatura:'); 
end 
disp(['valores da temperatura temperatura:', num2str(tem)]) 
for cont=1:c 
    fprintf('digite o comprimento das barra %d:\n ',cont); 
    b(cont) = input('comprimento da barra:'); 
end 
disp(['valor do comprimento da barra:',num2str(b)]) 
t=[co;tem]; 
disp(t) 
d = co .* tem .* b; 
re = d + b; 
fprintf('valores da barra após dilatação:'); 
disp(re)
