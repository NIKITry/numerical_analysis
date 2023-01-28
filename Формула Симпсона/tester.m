realValue = 4505991/31250;
for i = 1:13
    eps(i) = 10^(-i);
    count = 1;
    n = 2;
    [n, h, arrSepar] = Separation(n,[]);
    value = Simpson(h, n, arrSepar);
    while true
        count = count + 1;
        n = 2^(count);
        [n, h, arrSepar] = Separation(n,[]);
        value1 = Simpson(h, n, arrSepar);
        if (((abs(value1 - value)) / (2^4 - 1)) <= eps(i))
            temp(i) = count;
            errInFact(i) = abs(realValue - value1);
            break;
        end
        value = value1;
    end
end
x = 10^(-14):0.01:1;
figure
loglog(eps, errInFact)
hold on
grid on
loglog(eps, eps)
figure
semilogx(eps, temp)





