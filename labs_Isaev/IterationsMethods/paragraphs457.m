% ------ 4-5,7  paragraph ------

% Зададим положительно определенную симметричную матрицу и СЛАУ для нее
round_num = 20;
size_matrix = 10;
range = [1, 10];
root_range = [1, 100];
roots_analytic = randi(root_range, 1, size_matrix)';
D = diag(linspace(range(1), range(2), size_matrix));
[Q, R]=qr(ones(size_matrix, size_matrix)); 
test_matrix1 = Q * D * Q';
right_matrix1 = test_matrix1 * roots_analytic;

% Зададим СЛАУ для рандомной матрицы
test_matrix2 = round(rand(size_matrix) * round_num);
right_matrix2 = test_matrix2 * roots_analytic;

% Решаем СЛАУ функцией pcg для положительно определенной и симметричной матрицы
accuracy = 1e-10;
x1 = pcg(test_matrix1, right_matrix1, accuracy);
x2 = pcg(test_matrix2, right_matrix2, accuracy);

% 7 пункт
accuracy = 1e-10;
cond_array = 2 : 1000;
count = 0;
for i = cond_array
    count = count + 1;
    roots_analytic = randi(root_range, 1, i)';
    test_matrix = hilb(i);
    right_matrix = test_matrix * roots_analytic;
    [roots, is_not_converged, final_residual, iters, residuals_array] = pcg(test_matrix, right_matrix, accuracy);
    iterations(count) = iters; 
end

figure
semilogy(iterations, cond_array)
grid on
xlabel('iterations')
ylabel('cond')
legend('cond from iters')

% 6 пункт
accuracy = 1e-8;
size_matrix = 1000;
root_range = [1, 1000];
range = [1, 1000];
roots_analytic = randi(root_range, 1, size_matrix)';
D = diag(linspace(range(1), range(2), size_matrix));
[Q,R]=qr(ones(size_matrix, size_matrix)); 
test_matrix = Q * D * Q';
right_matrix = test_matrix * roots_analytic;
pcg(test_matrix, right_matrix, accuracy);


