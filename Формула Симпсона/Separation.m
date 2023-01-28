function [n, h, arrSepar] = Separation(n,ab)
    ab = [0,pi]; % было [-3.3, 0.9];
    h = (ab(2) - ab(1)) / n;
    count = 0;
    for i = ab(1):h:ab(2)
        count = count + 1;
        arrSepar(count) = i;
    end
end
% держи в голове, что n - четное, работать надо с n = 2m

