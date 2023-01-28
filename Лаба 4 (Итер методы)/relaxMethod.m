function roots = 
    w = 1.5; % параметр релаксации
    % E = 0.0001; % заданная точность
    sum1 = 0; % сумма 1 для формулы подсчета нового приближения
    sum2 = 0; % сумма 2 для формулы подсчета нового приближения
    n = 11; % размерность матрицы
    k = 0; % число итераций
    accuracy = []; % массив точностей корней заданного приближения
    max_accuracy = 0; %  максимлаьная точность корней заданного приближения

    % ищем численные решения c разной точностью
    for e = 1:12
        E = 10^(-e);
        k = 0;
        E_massive(e) = E;
        Xk_numerical = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        max_accuracy = 0;
        while true
            k = k + 1;
            for i = 1:n
                for j = 1:(i-1)
                    sum1 = sum1 + A(i,j) * Xk_numerical(k+1,j);
                end 

                for j = (i+1):n
                    sum2 = sum2 + A(i,j) * Xk_numerical(k,j);
                end
                Xk_numerical(k+1,i) = (1-w) * Xk_numerical(k,i) + (w/A(i,i))*(B(i) - sum1 - sum2);
                sum1 = 0;
                sum2 = 0;
            end

            % ищем точность корней заданного приближения
            for j = 1:n
                accuracy(j) = abs(Xk_numerical(k+1,j) - Xk_numerical(k,j));
            end

            % ищем максимальную точность среди корней заданного приближения 
            for j = 1:n
                if accuracy(j) > max_accuracy
                    max_accuracy = accuracy(j);
                end   
            end

            Xk_current = Xk_numerical;        
            Xk_current1(1,:) = X_current;       
            Xk_numerical1(1,:) = Xk_numerical(k+1,:);

            norm_mistake(e) = norm(Xk_current1 - Xk_numerical1);
            norm_residual(e) = norm(A * Xk_numerical1' - B);

            % условие остановки цикла
            if max_accuracy < E            
                break
            end
            max_accuracy = 0;
        end
        kk(e) = k;
    end

    figure
    subplot(1,2,1)
    loglog(E_massive,norm_mistake,'red');
    hold on
    loglog(E_massive,norm_residual,'blue');
    legend('красный - ошибка от точности','синий - невязка от точности') 
    subplot(1,2,2)
    semilogx(E_massive,kk,'green');
    legend('итерации от точности')


