function [matrixA, matrixB, a, b, c, xPoly, yPoly] = squareSpline(splineNodes, defaultNodes, interStep)
    diff1 = 1 + 1 / (0.1 * log(10)); % diff F in a
    diff2 = 1 + 1 / (1.1 * log(10)); % diff F in b
   % инициализируем промежуточные переменные, 
    step = interStep * 0.5;
    n = length(defaultNodes) - 1;
    matrixA = zeros(n+1);
    matrixB = zeros(n+1,1);
   
   % заполняем матрицу числами
    matrixA(1,1) = step/2 + 2 * defaultNodes(1) - 2 * splineNodes(2);
    matrixA(1,2) = -step/2;
    matrixA(n+1,n) = step/2;
    matrixA(n+1,n+1) = 1.5 * step + 2 * defaultNodes(n+1) - 2 * splineNodes(n+2);
    for i = 2:n
        for j = i-1:i+1
            if (j == i-1 || j == i+1)
                matrixA(i,j) = 1;
            else
                matrixA(i,j) = 6;
            end
        end
    end
   
   % заполняем правый столбец
 
   % посчитаем конечные разности
    for i = 1:n-1
        delta2(i) = F(defaultNodes(i+2)) - 2*F(defaultNodes(i+1)) + F(defaultNodes(i));
    end
   
    matrixB(1) = diff1 - (F(defaultNodes(2)) - F(defaultNodes(1))) / (2 * step);       %-(F(defaultNodes(2)) - F(defaultNodes(1))) / (2*step) + (1 + 1/(log(10)*defaultNodes(1))) * (1 - step);
    matrixB(n+1) = diff2 - (F(defaultNodes(n+1)) - F(defaultNodes(n))) / (2 * step); %1 + 1/(log(10)*defaultNodes(n+1)) - (F(defaultNodes(n+1)) - F(defaultNodes(n))) / (2 * step);
   
    for i = 2:n
        matrixB(i) = delta2(i-1) / (step^2);
    end
   
   % считаем матрицу (с)
    c = matrixA\matrixB;
    
   % считаем матрицу (b)
    for i = 1:n
        b(i,1) = step * 0.5 * (c(i) - c(i+1)) + 0.5 * ((F(defaultNodes(i+1))) - F((defaultNodes(i)))) / step;
    end
    b(n+1,1) = b(n,1) + 2*step*c(n+1);
    
   % считаем матрицу (a)
    for i = 1:n
        a(i,1) = step * (b(i) - step * c(i)) + F(defaultNodes(i));
    end
    a(n+1,1) = F(defaultNodes(n+1));
    count = 0;
    for j = 2:n+2
        for x = splineNodes(j-1):0.001:splineNodes(j)
            count = count + 1;
            xPoly(count) = x;
            yPoly(count) = a(j-1) + b(j-1) * (x - splineNodes(j)) + c(j-1) * (x - splineNodes(j))^2;
        end  
    end
end