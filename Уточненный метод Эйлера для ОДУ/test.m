analY = @(x) 1./exp(x);
ab = [-1,1];
startPoint = exp(1);
x3 = ab(1):0.01:ab(2);

% res with n = 11
n = 11;
[x1, h1] = Grid(n, ab);
y1 = ModifEuler(x1, h1, startPoint);

% res with n = 21
n = 21;
[x2, h2] = Grid(n, ab);
y2 = ModifEuler(x2, h2, startPoint);

figure
plot(x1, y1, '--mo', 'LineWidth', 1);
hold on
grid on
plot(x2, y2, '*', 'LineWidth', 1);
plot(x3, analY(x3), 'blue', 'LineWidth', 1);
legend('n = 11', 'n = 21','analytic');

figure
plot(x1, abs(y1 - analY(x1)), 'LineWidth', 1)
hold on
grid on
plot(x2, abs(y2 - analY(x2)), 'LineWidth', 1)
legend('n = 11', 'n = 21');

% accuracy from h
for i = 5:1000
    n = i;
    [x, h] = Grid(n, ab);
    y = ModifEuler(x, h, startPoint);
    accur(i-4) = norm(y - analY(x), Inf);
    step(i-4) = h;
    compare(i-4) = h^(2);
end
figure
loglog(step, accur)
hold on
grid on
loglog(step, compare)
legend('accuracy from step', 'h(p) where p = 2 from step')


% put disturb in startPoint
n = 21;
for i = 1:10
    disturb(i) = 10^(-i);
    disturbStart = startPoint + disturb(i);
    [x, h] = Grid(n, ab);
    y = ModifEuler(x, h, disturbStart);
    error(i) = norm(analY(x) - y, Inf);
    stepik(i) = h;
end
figure
loglog(disturb, error, 'LineWidth', 1)
grid on
legend('error from distrubance')



    
