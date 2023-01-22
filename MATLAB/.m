var = [Ax Ay Bx By Ma Mb];
eqs = [SFx SFy SMa SMb SMf SMo];
A = [Ax, 0, Bx, 0, 0, 0; 0, Ay, 0, By, 0, 0; 0, 0, - (Bx * Rbay), (By * Rbax), 0, Mb; - (Ax * Raby), (Ay * Rabx), 0, 0, Ma, 0; - (Ax * Rafy), (Ay * Rafx), - (Bx * Rbfy), (By * Rbfx), Ma, Mb;- (Ax * Raoy), (Ay * Raox), - (Bx * Rboy), (By * Rbox), Ma, Mb];
B = [-Fx; -Fy; -M - sum(cross(Rfa, F)); -M - sum(cross(Rfb, F)); -M; -M - sum(cross(Sfo, F))];
equationsToMatrix(A,B);
[Ax; Ay; Bx; By; Ma; Mb] = linsolve(A,B);
%Falta Fx, Fy e M
