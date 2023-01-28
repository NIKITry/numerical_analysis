function [num_roots, iters, current_accuracy] = RelaxMethod(w, A, B, accuracy, size_matrix)
    sum1 = 0;
    sum2 = 0;
    iters = 0;
    current_accuracy = accuracy + 1; % garbage value
    num_roots = zeros(1, size_matrix);
    while (current_accuracy > accuracy)
        iters = iters + 1;
        for i = 1 : size_matrix
            for j = 1 : (i - 1)
                sum1 = sum1 + A(i, j) * num_roots(iters + 1, j);
            end 

            for j = (i + 1) : size_matrix
                sum2 = sum2 + A(i, j) * num_roots(iters, j);
            end
            
            num_roots(iters + 1, i) = (1 - w) * num_roots(iters, i) + (w / A(i,i)) * (B(i) - sum1 - sum2);
            sum1 = 0;
            sum2 = 0;
        end

        % ищем точность решения на k-м приближении
        current_accuracy = norm(num_roots(iters + 1, :) - num_roots(iters, :));
%         if (~ (norm(roots_analytic' - num_roots(iters + 1, :)) <= (norm(triu(iter_matrix))) / (1 - norm(iter_matrix)) * current_accuracy))
%             fail = 1
%         end
    end
    % take only last approximation
    num_roots = num_roots(iters + 1, :);
end


