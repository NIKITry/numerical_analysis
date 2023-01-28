function [h, y, xh] = superPosition(n, ab)
    % делаем равномерную сетку
    h = (ab(2) - ab(1)) / (n-1);    
    for i = 1:n
        xh(i) = ab(1) + (i-1) * h;
    end
    % н.у. для задач коши
    u1(1) = 0; u2(1) = 0;
    v1(1) = 1; v2(1) = 0;
    w1(1) = 0; w2(1) = 1;
    [u1, u2] = ModifEuler(xh, h, 1, u1, u2);
    [v1, v2] = ModifEuler(xh, h, 0, v1, v2);
    [w1, w2] = ModifEuler(xh, h, 0, w1, w2);
    
    % строим слау вида A*C=B
    tmp = length(v1);
    A = [1, 0; v1(tmp) + v2(tmp), w1(tmp) + w2(tmp)];
    B = [1; -1 - u1(tmp) - u2(tmp)];
    C = A\B;
    
    % окончательно строим y
    y = u1 + C(1) * v1 + C(2) * w1;
end