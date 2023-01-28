function [y1,y2] = EulerForSystem(xh, h, flag, y1, y2)
    for i = 2:length(xh)
        y1(i) = y1(i-1) + h*y2(i-1);
        y2(i) = y2(i-1) + h*((1 - cos(xh(i-1)))*flag - y1(i-1)*cos(xh(i-1)) + y2(i-1)*sin(xh(i-1)));
    end
end















