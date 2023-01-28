function value = Simpson(h, n, arrSepar)
    m = n / 2 - 1;
    value = 0;
    for i = 1:m+1
        value = value + F(arrSepar(2*i-1)) + 4*F(arrSepar(2*i)) + F(arrSepar(2*i+1));
    end
    value = value * (h/3);
end

