function [y1, y2] = ModifEuler(xh, h, flag, y1, y2)
    for i = 2:length(xh)
        temp1 = y1(i-1) + h/2 * y2(i-1);
        temp2 = y2(i-1) + h/2 * ((1 - cos(xh(i-1)))*flag - y1(i-1)*cos(xh(i-1)) + y2(i-1)*sin(xh(i-1))); 
        y1(i) = y1(i-1) + h * temp2;
        y2(i) = y2(i-1) + h * ((1 - cos(xh(i-1)+h/2))*flag - temp1*cos(xh(i-1)+h/2) + temp2*sin(xh(i-1)+h/2));
    end
end

