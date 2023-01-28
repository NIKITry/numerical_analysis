function y = ModifEuler(x, h, startPoint)
    y(1) = startPoint;
    % start point   
    for i = 2:length(x)
        temp = y(i-1) + h/2 * dY(x(i-1), y(i-1));
        y(i) = y(i-1) + h * dY((x(i-1) + h/2), temp);
    end
end

