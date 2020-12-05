X = [ infsup(-5,5) ; infsup(-5,5) ];
[Z, WL] = globopt0(X);
 close all
 
%  Рабочий список
 for i = 1:201
     plotintval(WL(i).Box, 'n')
%      D = mid(WL(i).Box)
%      if i <= 15
%         text(D(1), D(2), string(i));
%      end
     hold on
 end



% График сужения интервала
maxr = [];
x = 1:201;
for i = 1:201
    a = WL(i).Box(1).sup - WL(i).Box(1).inf
    b = WL(i).Box(2).sup - WL(i).Box(2).inf
    c = a
    if b > a
        c = b
    end
    maxr = [maxr, c]
end
grid on;
semilogy(x, maxr);
hold on;

% График функции
[X,Y] = meshgrid(-10:.05:10);
Z = (X.*X + Y - 11).*(X.*X + Y - 11) + (X + Y.*Y - 7).*(X + Y.*Y - 7);
mesh(X, Y, Z)
xlabel('x')
ylabel('y')
zlabel('z')
colormap(jet); 
shading interp