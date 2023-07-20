clc; clear
x = input('Dijite um numero: ');
while(x<0)
    x = input('Dijite um numero: ');
    disp('Não')
end
fac = 1;
for cont = 2:x
    fac = cont*fac;
end
disp(fac)
