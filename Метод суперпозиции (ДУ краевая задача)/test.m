ab = [0,pi/2];
accurSolve = @(x) cos(x); % точное решение
xh = ab(1):0.001:ab(2);

% первый шаг
n = 30;
[h1, y1, xh1] = superPosition(n, ab);

% второй шаг
n = 60;
[h2, y2, xh2] = superPosition(n, ab);

% точное и численнное решение
figure
plot(xh1, y1)
hold on
grid on
plot(xh, accurSolve(xh))
plot(xh2, y2)
legend('num with n = 30', 'accur', 'num with n = 60')

% ошибка на отрезке
figure
plot(xh1, abs(y1 - accurSolve(xh1)))
hold on
grid on
plot(xh2, abs(y2 - accurSolve(xh2)))
xlabel('x')
ylabel('error')
legend('error n = 30', 'error n = 60')

tmp = 0;
for n = 1:1000
    tmp = tmp + 1;
    [h, y, xh] = superPosition(n, ab);
    accur(tmp) = norm(y - accurSolve(xh), Inf);
    step(tmp) = h;
    compare(tmp) = h^(2);
end
figure
loglog(step, accur)
hold on
grid on
loglog(step, compare)
legend('accuracy from step', 'h^p where p = 2 from step')




