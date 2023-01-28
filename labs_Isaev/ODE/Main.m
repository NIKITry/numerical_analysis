% Аналитическое решение 1 оду из п2
analytic_y1 = @(x) x.^2 + 0.4 * x + 0.08; 
% Аналитическое решение 2 оду из п2
analytic_y2 = @(x) 0.1 + 9 * exp(-100 * x) / 10;

% Зададим отрезок решения 1 и 2 ОДУ и кол-во точек
ab = [0, 1];
n = 40;

% задача Коши для 1 ОДУ из п2
startPoint1 = 0.08;
startPoint2 = 1;

% Применяем численные методы решения 1 ОДУ
[y1, x, h] = ExplicitEulerForFisrtODE(ab, n, startPoint1); 
y2 = NonExplicitEulerForFirstODE(ab, n, startPoint1);
% display(h) % раскомментируй, если захочешь показать, какой шаг ты использовал для построения сетки


% Для 1 ОДУ

    % Построим интегральную кривую по методу Эйлера для 1 ОДУ для y(0) = 0.08
analytic_y = analytic_y1(x);
figure
subplot(2, 2, 1)
plot(x, y1)
hold on
grid on
plot(x, y2)
plot(x, analytic_y)
xlabel('x')
ylabel('y')
legend('Явный Эйлер', 'Неявный Эйлер', 'Аналитическое решение', 'Location', 'northwest')
title('Интегральная кривая по методу Эйлера для y(0) = 0.08')

    % Построим интегральную кривую по методу Эйлера для 1 ОДУ вблизи y(0) = 0.08 (возьмем 0.1)
startPoint = 0.1;
y3 = ExplicitEulerForFisrtODE(ab, n, startPoint);
y4 = NonExplicitEulerForFirstODE(ab, n, startPoint);


subplot(2, 2, 2)
plot(x, y3)
hold on
grid on
plot(x, y4)
plot(x, analytic_y)
xlabel('x')
ylabel('y')
legend('Явный Эйлер', 'Неявный Эйлер', 'Аналитическое решение', 'Location', 'northwest')
title('Интегральная кривая по методу Эйлера для y(0) = 0.1')

    % График ошибки на отрезке для 1 ОДУ
subplot(2, 2, 3 : 4)
plot(x, abs(y1 - analytic_y))
hold on
grid on
plot(x, abs(y2 - analytic_y))
plot(x, abs(y3 - analytic_y))
plot(x, abs(y4 - analytic_y))
legend('Я.Э. при y(0)=0.08', 'Н.Э. при y(0)=0.08', 'Я.Э. при y(0)=0.1', 'Н.Э. при y(0)=0.1', 'Location', 'northwest')
xlabel('x')
ylabel('max error')
title('ошибка на отрезке')


% Для 2 ОДУ

    % Построим интегральные кривые по методу Эйлера для 2 ОДУ для y(0) = 1
    % при шаге h = 0.02 (51 узел), h = 0.0185 (55 узлов), h = 0.0217 (47 узлов)
    
% Применяем численные методы решения 2 ОДУ для 3-х шагов
n = 51;
[y1, x1, h1] = ExplicitEulerForSecondODE(ab, n, startPoint2);
y2 = NonExplicitEulerForSecondODE(ab, n, startPoint2);

n = 55;
[y3, x3, h3] = ExplicitEulerForSecondODE(ab, n, startPoint2);
y4 = NonExplicitEulerForSecondODE(ab, n, startPoint2);

n = 47;
[y5, x5, h5] = ExplicitEulerForSecondODE(ab, n, startPoint2);
y6 = NonExplicitEulerForSecondODE(ab, n, startPoint2);

figure
analytic_y = analytic_y2(x);
subplot(3, 3, 1)
plot(x1, y1)
hold on
grid on
plot(x1, y2, '*')
plot(x, analytic_y)
xlabel('x')
ylabel('y')
legend('Явный Эйлер', 'Неявный Эйлер', 'Аналитическое решение', 'Location', 'northwest')
title(['h = ' num2str(h1)])

subplot(3, 3, 2)
plot(x3, y3)
hold on
grid on
plot(x3, y4, '*')
plot(x, analytic_y)
xlabel('x')
ylabel('y')
legend('Явный Эйлер', 'Неявный Эйлер', 'Аналитическое решение', 'Location', 'northwest')
title(['h = ' num2str(h3)])

subplot(3, 3, 3)
plot(x5, y5)
hold on
grid on
plot(x5, y6, '*')
plot(x, analytic_y)
xlabel('x')
ylabel('y')
legend('Явный Эйлер' , 'Неявный Эйлер', 'Аналитическое решение', 'Location', 'northwest')
title(['h = ' num2str(h5)])

    % График ошибки на отрезке для 2 ОДУ
subplot(2, 1, 2)
semilogy(x1, abs(y1 - analytic_y2(x1)))
hold on
grid on
semilogy(x1, abs(y2 - analytic_y2(x1)))
semilogy(x3, abs(y3 - analytic_y2(x3)))
semilogy(x3, abs(y4 - analytic_y2(x3)))
semilogy(x5, abs(y5 - analytic_y2(x5)))
semilogy(x5, abs(y6 - analytic_y2(x5)))
h1 = sprintf('%.6f', h1);
str1 = ['Я.Э. h = ', h1];
str2 = ['Н.Э. h = ', h1];
str3 = ['Я.Э. h = ', num2str(h3)];
str4 = ['Н.Э. h = ', num2str(h3)];
str5 = ['Я.Э. h = ', num2str(h5)];
str6 = ['Н.Э. h = ', num2str(h5)];
legend(str1, str2, str3, str4, str5, str6, 'Location', 'southwest')
xlabel('x')
ylabel('max error')
title('ошибка на отрезке')

% Зависимость максимальной ошибки от шага для 2 ОДУ

% покажем, что существует пороговое значение шага, при приближении к
% которому устойчивость данной задачи пропадает и накапливается большая ошибка:
points = 1000;
error_explicit = zeros(1, points);
error_non_explicit = zeros(1, points);
step = zeros(1, points);
for i = 2 : points
    [y3, ~, h] = ExplicitEulerForSecondODE(ab, i, startPoint2);
    [y4, x] = NonExplicitEulerForSecondODE(ab, i, startPoint2);
    analytic_solve = analytic_y2(x);
    error_explicit(i - 1) = max(abs(y3 - analytic_solve));
    error_non_explicit(i - 1) = max(abs(y4 - analytic_solve));
    step(i - 1) = h;
end

figure
semilogy(step, error_explicit)
hold on
grid on
semilogy(step, error_non_explicit)
xline(0.02, 'LineWidth', 1.5)
xlabel('h'), 
ylabel('error')
legend('Я.Э.', 'Н.Э.', 'Порог Устойчивости x = 0.02')
title('ошибка от шага')





