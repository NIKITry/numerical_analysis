ab = [0,pi/2];
accurSolve = @(x) cos(x); % точное решение
xh = ab(1):0.001:ab(2);
n = 4;
[h1, y1, xh1] = superPosition(n, ab);
% figure
% plot(xh1, y1)
% hold on
% plot(xh, accurSolve(xh))
% legend('n=4','accur')