E = 1;
m = -10:0.02:10;
trans = Z(m);
poly = Y(m);
a = -5;
b = -1;
t = 0;
p = 0.5;
const = 12;
% половинное деление для полинома
k=0;
xx = 1:const;
e = 1:const;
iter = 1:const;
for i = 1:const
    E = E * 10^(-1);
    e(i) = E;
    if (Y(a)*Y(b) < 0)
        while abs(b-a) > E
            c = (a+b)/2;
            if Y(a)*Y(c) < 0
                b = c;
            else
                a = c;
            end
            k = k+1;
        end
        x = (a+b)/2;
        xx(i) = abs(Y(x));
        a= -5;
        b = -1;
        iter(i)=k;
        k=0;                
    end
end
iter1 = iter;
e1 = e;
xx1 = xx;

% половинное деление для трансцендентной
xx = 1:const;
e = 1:const;
iter = 1:const;
E = 1;
k = 0;

for i = 1:const
    E = E * 10^(-1);
    e(i) = E;
    if (Z(t)*Z(p) < 0)
        while abs(p-t) > E
            c = (t+p)/2;
            if Z(t)*Z(c) < 0
                p = c;
            else
                t = c;
            end
            k = k+1;
        end    
        x = (t+p)/2;
        xx(i) = abs(Z(x));
        t= -2;
        p = 1;
        iter(i)=k;
        k=0;                
    end
end
iter2 = iter;
e2 = e;
xx2 = xx;




% Метод Ньютона для полинома

x0 = a; % начальное приближение
a = -3; % граница слева
b = -2.5; % граница справа
E = 1;
k = 0;
xx = 1:const;
e = 1:const;
iter = 1:const;
v = 228/(2*54);

for i = 1:const
    E = E * 10^(-1);
    e(i) = E;
    x1 = x0 - Y(x0)/T(x0);
    while v * abs(x1 - x0)^2 >= E
        x0 = x1;
        x1 = x0 - Y(x0)/T(x0);
        k = k+1;
    end
    xx(i) = abs(Y(x1));
    iter(i)=k;
    k=0;
    x0 = a;    
end
iter3 = iter;
e3 = e;
xx3 = xx;


% Метод Ньютона для трансцендентной

x0 = p; % начальное приближение
E = 1;
k = 0;
xx = 1:const;
e = 1:const;
iter = 1:const;
l = 1.6/(2.6*2);

for i = 1:const
    E = E * 10^(-1);
    e(i) = E;
    x1 = x0 - Z(x0)/X(x0);
    while l*abs(x1 - x0)^2 >= E
        x0 = x1;
        x1 = x0 - Z(x0)/X(x0);
        k = k+1;
    end
    xx(i) = abs(Z(x1));
    iter(i)=k;
    k=0;
    x0 = p;   
end
iter4 = iter;
e4 = e;
xx4 = xx;

figure 
grid on
loglog(e1,xx1);
hold on 
grid on
loglog(e2,xx2);
loglog(e3,xx3);
loglog(e4,xx4);
legend('МПД-П','МПД-Т','МН-П','МН-Т');

figure 
grid on
semilogx(e1,iter1);
hold on 
grid on
semilogx(e2,iter2);
semilogx(e3,iter3);
semilogx(e4,iter4);
legend('МПД-П','МПД-Т','МН-П','МН-Т');





