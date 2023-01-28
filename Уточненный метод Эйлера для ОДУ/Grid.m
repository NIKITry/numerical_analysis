function [x, h] = Grid(n, ab)
    % задаем равноотстоящие узлы функции
    h = (ab(2) - ab(1)) / (n-1);
    for i = 1:n
        x(i) = ab(1) + (i-1) * h;
    end
end