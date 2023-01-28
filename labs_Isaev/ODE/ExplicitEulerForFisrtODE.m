function [y, x, h] = ExplicitEulerForFisrtODE(ab, n, startPoint)
    [x, h] = Grid(n, ab);
    % вносим стартовую точку в массив численных решений интегральной кривой
    y(1) = startPoint;
    len = length(x);
    for i = 2 : len
        y(i) = y(i - 1) + h * dy1(x(i - 1), y(i - 1));
    end
end