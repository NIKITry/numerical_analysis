% ------ 1-2 paragraph ------
size_matrix = 10;
round_num = 20;
relax_param = 1.5;
test_matrix = round(rand(size_matrix) * round_num);
add_num = size_matrix * round_num;
% add to test_matrix's diag elements add_num to have diagonal dominance in test_matrix
test_matrix = test_matrix + diag((diag(test_matrix) + add_num));
% setting roots and calc right_matrix for AX = B
root_range = [1, 100];
roots_analytic = randi(root_range, 1, size_matrix)';
right_matrix = test_matrix * roots_analytic;

% ---Calc norm mistake from plenty eps---

%Проверим апостериорную оценку погрешности для метода релаксации
for  i = 1 : size_matrix
    iteration_matrix(i, :) = -test_matrix(i, :) / test_matrix(i, i);
    iteration_matrix(i, i) = 0;
end

for i = 1 : 10
    eps(i) = 10^(-i);
    [roots_num, iters, cur_accuracy] = RelaxMethod(relax_param, test_matrix, right_matrix, eps(i), size_matrix);
    norm_mistake(i) = norm(roots_num' - roots_analytic);
    norm_residual(i) = norm(test_matrix * roots_num' - right_matrix);
    iterations(i) = iters;
end

figure

subplot(3, 1, [1,2])
loglog(eps, norm_residual)
hold on
grid on
loglog(eps, norm_mistake)
legend('residual', 'mistake')
ylabel('values')
xlabel('setted accuracy')

subplot(3, 1, 3)
semilogy(iterations, norm_mistake)
xlabel('iterations')
ylabel('mistake normalized')
grid on

% --Calc speed convergence from diag dominance and cond

eps = 10E-11;
for i = 2 : 5
    matrix_hilb = hilb(i);
    matrix_cond(i - 1) = cond(matrix_hilb);
    roots_analytic = randi([1 100], 1, i)';
    right_matrix = matrix_hilb * roots_analytic;
    [roots_num, iters, cur_accuracy] = RelaxMethod(relax_param, matrix_hilb, right_matrix, eps, i);
    iterations1(i - 1) = iters;
end

count = 0;
additionals_nums = 1 : 50 : 500;
size_matrix = 10;
for i = additionals_nums
    count = count + 1;
    additionals_nums(count) = i;
    test_matrix = round(rand(size_matrix) * round_num);
    test_matrix = test_matrix + diag((diag(test_matrix) + i));
    roots_analytic = randi([1 100], 1, size_matrix)';
    right_matrix = test_matrix * roots_analytic;
    [roots_num, iters, cur_accuracy] = RelaxMethod(relax_param, test_matrix, right_matrix, eps, size_matrix);
    iterations2(count) = iters;
end

figure

subplot(2, 1, 1)
loglog(matrix_cond, iterations1)
grid on
xlabel('cond')
ylabel('iterations')
legend('скорость сходимости от числа обусловленности при заданной точности 10E-11')

subplot(2, 1, 2)
semilogy(additionals_nums, iterations2)
grid on
xlabel('diag dominance')
ylabel('iterations')
legend('скорость сходимости от нарастания диагонального преобладания при заданной точности 10E-11')

% добавить случай, когда нет достаточного условия сходимости?!
















