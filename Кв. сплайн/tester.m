interval = [0.1,1.1];

% 3 узла
n = 3;
[splineNodes, defaultNodes, interStep] = splineGrid(interval, n);
[matrixA, matrixB, a, b, c, xPoly, yPoly] = squareSpline(splineNodes, defaultNodes, interStep);
xPoly1 = xPoly;
yPoly1 = yPoly;

figure
plot(xPoly,yPoly,'--b','LineWidth',1.5)
hold on
grid on
plot(xPoly,F(xPoly), 'r')
xlabel('координата') 
ylabel('значение функции')
legend('numerical derivation, n = 3', 'exact derivation')

% 5 узлов
n = 5;
[splineNodes, defaultNodes, interStep] = splineGrid(interval, n);
[matrixA, matrixB, a, b, c, xPoly, yPoly] = squareSpline(splineNodes, defaultNodes, interStep);
xPoly2 = xPoly;
yPoly2 = yPoly;

figure
plot(xPoly,yPoly, '--b','LineWidth',1.5)
hold on
grid on
plot(xPoly,F(xPoly), 'r')
xlabel('координата') 
ylabel('значение функции')
legend('numerical derivation, n = 5', 'exact derivation')

% 9 узлов
n = 9;
[splineNodes, defaultNodes, interStep] = splineGrid(interval, n);
[matrixA, matrixB, a, b, c, xPoly, yPoly] = squareSpline(splineNodes, defaultNodes, interStep);
xPoly3 = xPoly;
yPoly3 = yPoly;

figure
plot(xPoly,yPoly, '--b','LineWidth',1.5)
hold on
grid on
plot(xPoly,F(xPoly), 'r')
xlabel('координата') 
ylabel('значение функции')
legend('numerical derivation, n = 9', 'exact derivation')

% ошибка от координаты 
figure
plot(xPoly1, (yPoly1 - F(xPoly1)))
hold on
grid on
plot(xPoly2, (yPoly2 - F(xPoly2)))
plot(xPoly3, (yPoly3 - F(xPoly3)))
xlabel('координата') 
ylabel('макс ошибка')
legend('3 узла', '5 узлов', '9 узлов')

% ошибка от узлов
count = 0;
figure
for i = 2:2:500
    count = count + 1;
    [splineNodes, defaultNodes, interStep] = splineGrid(interval, i);
    nodesCount(count) = interStep;
    [matrixA, matrixB, a, b, c, xPoly, yPoly] = squareSpline(splineNodes, defaultNodes, interStep);
    maxMistake(count) = norm(yPoly - F(xPoly));
    compare(count) = interStep^3; 
end
loglog(nodesCount,maxMistake)
hold on
grid on
loglog(nodesCount, compare)
xlabel('кол-во узлов') 
ylabel('макс ошибка')