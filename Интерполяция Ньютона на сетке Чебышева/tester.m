ab = [0.1, 0.2]; % бери маленький отрезок, чтобы рекурсия много не считала

% 1 опыт
figure
subplot(1,3,1)
n = 2;
[Xpoly1,Ypoly1, nodesCheb] = interNewton(ab,n);
plot(Xpoly1,Ypoly1)
hold on
grid on
plot(Xpoly1,F(Xpoly1))
plot(nodesCheb, F(nodesCheb),'ro')
legend('polynom with n=3', 'F(x)', 'nodes', 'Location','northwest')

% 2 опыт
subplot(1,3,2)
n = 3;
[Xpoly2,Ypoly2, nodesCheb] = interNewton(ab,n);
plot(Xpoly2,Ypoly2)
hold on
grid on
plot(Xpoly2,F(Xpoly2))
plot(nodesCheb, F(nodesCheb), 'ro')
legend('polynom with n=4', 'F(x)', 'nodes', 'Location','northwest')

% 3 опыт
subplot(1,3,3)
n = 5;
[Xpoly3,Ypoly3, nodesCheb] = interNewton(ab,n);
plot(Xpoly3,Ypoly3)
hold on
grid on
plot(Xpoly3,F(Xpoly3))
plot(nodesCheb, F(nodesCheb), 'ro')
legend('polynom with n=6', 'F(x)', 'nodes', 'Location','northwest')

% ошибка на отрезке
figure
subplot(3,3,[1,3])
plot(Xpoly1, Ypoly1 - F(Xpoly1))
hold on
grid on
plot(Xpoly2, Ypoly2 - F(Xpoly2))
plot(Xpoly3, Ypoly3 - F(Xpoly3))
legend('n=3','n=4', 'n=6')

% ошибка от узлов
subplot(3,3,[4,9])
count = 0;
for n = 1:2:23
    count = count + 1;
    k(count) = n+1;
    [Xpoly,Ypoly] = interNewton(ab,n);
    maxMistake(count) = norm(Ypoly - F(Xpoly), Inf);
end
semilogy(k,maxMistake)
grid on
xlabel('кол-во узлов') 
ylabel('макс ошибка')