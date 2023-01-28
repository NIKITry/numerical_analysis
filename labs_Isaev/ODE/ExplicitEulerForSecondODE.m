function [y, x, h] = ExplicitEulerForSecondODE(ab, n, startPoint)
    [x, h] = Grid(n, ab);
    % вносим стартовую точку в массив численных решений интегральной кривой
    y(1) = startPoint;
    len = length(x);
    for i = 2 : len
        y(i) = y(i - 1) + h * dy2(y(i - 1));
    end
end