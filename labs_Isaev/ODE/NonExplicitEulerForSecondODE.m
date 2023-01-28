function [y, x] = NonExplicitEulerForSecondODE(ab, n, startPoint)
    [x, h] = Grid(n, ab);
    % вносим стартовую точку в массив численных решений интегральной кривой
    y(1) = startPoint;
    len = length(x);
    for i = 2 : len
        % вычислим значение y в точке c учетом линейности второго диффура
        % из пункта 2
        y(i) = (y(i - 1) + 10 * h) / (1 + 100 * h);
    end
end