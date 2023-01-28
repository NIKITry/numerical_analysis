max = 0; % переменная для перебора максимального элемента
index = 0; % переменная индекса максимального элемента в переборе
swap = 0; % переменная перестановки
m = 0; % коэффициент для деления элементов матрицы
n = 0;
% A1 = A;
% sum = 0;
% A = [A, B]; % расширенная матрица
% 
% прямой ход Гаусса %
% находим ведущий элемент и ставим его в на диагональную позицию
for j = 1:4
    n = n + 1;
    for i = n:4
        if A(i,j) > max
        max = A(i,j);
        index = i;
        end
    end    
    if A(j,j) < max
    swap = A(j,:);
    A(j,:) = A(index,:);
    A(index,:) = swap;
    end
    max = 0;
end

n = 2;
% делаем верхнюю треугольную матрицу
for j = 1:4
    for i = n:4
        m = A(i,j)/A(j,j);
        A(i,:) = A(i,:) - m * A(j,:);
    end
    n = n + 1;
end
B = A(:,n-1);

%выпишем решения
X1(11) = B(11)/A(11,11);
sum = 0;
n = 11;
for i = 10:-1:1
    for j = 11:-1:n
        sum = sum + X1(j)*A(i,j);
    end
    n = n - 1;
    X1(i) = (B(i) - sum)/A(i,i);
    sum = 0;
end   

% метод с матрицей Гильберта
% for p = 1:2
%     for k = 2:11
%         n = 0;
%         H = hilb(k);
%         current_X = current_X_Basic(1:k);
%         B_hilbert = H * current_X;
%         if p == 2
%             B_hilbert_without_disturbance = B_hilbert
%             t = (rand(k,1)* 0.05);
%             B_hilbert = B_hilbert_without_disturbance + t 
%         end
%         H = [H, B_hilbert];
%         for j = 1:k
%             n = n + 1;
%             for i = n:k
%                 if H(i,j) > max
%                 max = H(i,j);
%                 index = i;
%                 end
%             end    
%             if H(j,j) < max
%             swap = H(j,:);
%             H(j,:) = H(index,:)
%             A(index,:) = swap;
%             end
%             max = 0;
%         end
%         n = 2;
%         for j = 1:k
%             for i = n:k
%                 m = H(i,j)/H(j,j);
%                 H(i,:) = H(i,:) - m * H(j,:);
%             end
%             n = n + 1;
%         end
%         B_hilbert = H(:,k+1);
%         numerical_X(k) = B_hilbert(k)/H(k,k);
%         sum = 0;
%         n = k;
%         for i = k-1:-1:1
%             for j = k:-1:n
%                 sum = sum + numerical_X(j)*H(i,j);
%             end
%             n = n - 1;
%             numerical_X(i) = (B_hilbert(i) - sum)/H(i,i);
%             sum = 0;
%         end
%         H1 = H(1:k,1:k);
%         norm_mistake(k) = norm(current_X - numerical_X');
%         norm_residual(k) = norm(H1 * numerical_X' - B_hilbert);
%         dimension(k) = cond(H1);
%         if p==2
%            if  ((norm_mistake(k))/norm(current_X))/norm(current_X) <= cond(H1) * norm(t)/norm(B_hilbert)
%                b(k) = (norm_mistake(k))/norm(current_X);
%                x(k) = norm(current_X);
%                c(k) = cond(H1);
%                bB(k) = norm(t);
%                BH(k) = norm(B_hilbert);             
%            end
%         end
%         current_X = current_X_Basic;
%     end
%     if p == 1
%         numerical_X = 0;
%         figure
%         loglog(dimension,norm_mistake,'red');
%         hold on
%         loglog(dimension,norm_residual);
%     end
%     if p == 2        
%         figure
%         loglog(dimension,norm_mistake,'red');
%         hold on
%         loglog(dimension,norm_residual);
%         legend('dim-mistake', 'dim-residual')
%     end
% end



    




        
        
        
        
        
        
    
    
    