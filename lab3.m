addpath('IntLinIncR2_UTF8');
addpath('IntLinIncR3_UTF8');

Aconst=[3 4;5 3;7 3]
A=[infsup(2,4) infsup(3,5);infsup(3,7) infsup(1,5);infsup(6,8) infsup(0,6)]
x=[1;-1]
bconst=Aconst*x
b=[infsup(-4,2);infsup(-1,5);infsup(1,7)]
[V, P1, P2, P3, P4]=EqnTolR2(inf(A),sup(A),inf(b),sup(b))
Cminim=cond(inf(A));
MatrixM=[0 0;0 0;0 0]
b1=inf(A);
for i1=inf(A(1,1)):(sup(A(1,1))-inf(A(1,1))):sup(A(1,1))
for i2=inf(A(1,2)):(sup(A(1,2))-inf(A(1,2))):sup(A(1,2))
for j1=inf(A(2,1)):(sup(A(2,1))-inf(A(2,1))):sup(A(2,1))
for j2=inf(A(2,2)):(sup(A(2,2))-inf(A(2,2))):sup(A(2,2))
for k1=inf(A(3,1)):(sup(A(3,1))-inf(A(3,1))):sup(A(3,1))
for k2=inf(A(3,2)):(sup(A(3,2))-inf(A(3,2))):sup(A(3,2))
if cond([i1 i2;j1 j2;k1 k2])<=b1
Cminim=cond([i1 i2;j1 j2;k1 k2]);
MatrixM=[i1 i2;j1 j2;k1 k2];
end
end
end
end
end
end
end
disp('Cmin=')
disp(Cminim)
disp('Matrix=')
disp(MatrixM)
disp('__________________')

maxTol = 0.79999848;
argmaxTol = [3.00001126e-01, -9.95656196e-07]';
% [maxTol,argmaxTol,envs,ccode]=tolsolvty(inf(A),sup(A),inf(b),sup(b))
ive=sqrt(2)*Cminim*maxTol*(norm(argmaxTol)/norm(mid(b)))
Xsolv=[argmaxTol-ive,argmaxTol+ive]
rectangle('Position',[Xsolv(1,1) Xsolv(2,1) Xsolv(1,2)-Xsolv(1,1) Xsolv(2,2)-Xsolv(2,1) ])
rectangle('Position',[argmaxTol(1) argmaxTol(2) 0.003 0.003 ],'EdgeColor','r')
text(argmaxTol(1)+0.02,argmaxTol(2),'argmaxTol','FontSize',8)
Title_str='ISLAU Solution'
title(Title_str)
[m, n] =size(Aconst)
xlabel('\it x_1')
ylabel('\it x_2')
title_str_name=strcat(Title_str,' ',num2str(m),' x ',num2str(n))
figure_name_out=strcat(title_str_name,'.png')
print('-dpng', '-r300', figure_name_out), pwd



disp('_____________________________Second_Part_____________________________')
Aconst2=[3 4;5 3;7 3]'
A2=[infsup(2,4) infsup(3,5);infsup(3,7) infsup(1,5);infsup(6,8) infsup(0,6)]'
x2=[1;-2;2]
bconst2=Aconst2*x2
b2=[infsup(4,10);infsup(1,7)]


% [Z]=EqnTolR3(inf(A2),sup(A2),inf(b2),sup(b2),1,1)
% 
% hold on
% 
% scatter3(5.55555215e-01, 5.79226594e-07, 5.92592511e-01, 'm*');
% 
% plot3([0.2623 0.8488], [-0.2932  -0.2932 ], [0.2993 0.2993], 'black');
% plot3([0.2623 0.8488], [0.2932 0.2932], [0.2993 0.2993], 'black');
% plot3([0.2623 0.8488], [-0.2932  -0.2932 ], [0.8858 0.8858], 'black');
% plot3([0.2623 0.8488], [0.2932 0.2932], [0.8858 0.8858], 'black');
% 
% plot3([0.2623 0.2623], [-0.2932   0.2932], [0.2993 0.2993], 'black');
% plot3([0.2623 0.2623], [-0.2932   0.2932], [0.8858 0.8858], 'black');
% plot3([0.8488 0.8488], [-0.2932   0.2932], [0.2993 0.2993], 'black');
% plot3([0.8488 0.8488], [-0.2932   0.2932], [0.8858 0.8858], 'black');
% 
% plot3([0.2623 0.2623], [-0.2932  -0.2932 ], [0.2993 0.8858], 'black');
% plot3([0.2623 0.2623], [0.2932 0.2932], [0.2993 0.8858], 'black');
% plot3([0.8488 0.8488], [-0.2932  -0.2932 ], [0.2993 0.8858], 'black');
% plot3([0.8488 0.8488], [0.2932 0.2932], [0.2993 0.8858], 'black');

%for looking plot from First part- comment [Z]

Cminim2=cond(inf(A2));
MatrixM2=[0 0;0 0;0 0]';
b12=inf(A2);
for i1=inf(A2(1,1)):(sup(A2(1,1))-inf(A2(1,1))):sup(A2(1,1))
for i2=inf(A2(1,2)):(sup(A2(1,2))-inf(A2(1,2))):sup(A2(1,2))
for i3=inf(A2(1,3)):(sup(A2(1,3))-inf(A2(1,3))):sup(A2(1,3))
for j1=inf(A2(2,1)):(sup(A2(2,1))-inf(A2(2,1))):sup(A2(2,1))
for j2=inf(A2(2,2)):(sup(A2(2,2))-inf(A2(2,2))):sup(A2(2,2))
for j3=inf(A2(2,3)):(sup(A2(2,3))- inf(A2(2,3))):sup(A2(2,3))
if cond([i1 i2 i3;j1 j2 j3])<=b12
Cminim2=cond([i1 i2 i3;j1 j2 j3]);
MatrixM2=[i1 i2 i3;j1 j2 j3];
end
end
end
end
end
end
end
disp('Cmin2=')
disp(Cminim2)
disp('Matrix2=')
disp(MatrixM2)
disp('__________________')

maxTol2 = 0.66666596;
argmaxTol2 = [5.55555215e-01 5.79226594e-07 5.92592511e-01]';
% [maxTol2,argmaxTol2,envs2,ccode2]=tolsolvty(inf(A2),sup(A2),inf(b2),sup(b2))
ive2=sqrt(3)*Cminim2*maxTol2*(norm(argmaxTol2)/norm(mid(b2)))
Xsolv2=[argmaxTol2-ive2,argmaxTol2+ive2]
Title_str='ISLAU Solution'
title(Title_str)
[m, n] =size(Aconst2)
xlabel('\it x_1')
ylabel('\it x_2')
zlabel('\it x_3')
title_str_name=strcat(Title_str,' ',num2str(m),' x ',num2str(n))
figure_name_out=strcat(title_str_name,'.png')
print('-dpng', '-r300', figure_name_out), pwd

