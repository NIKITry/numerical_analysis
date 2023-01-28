function [splineNodes, defaultNodes, interStep] = splineGrid(interval, n)
    count = 0;
    interStep = (interval(2) - interval(1)) / (n - 1);
    % задаем равноотстоящие узлы
    for i = interval(1):interStep:interval(2)
        count = count + 1;
        defaultNodes(count) = i;
    end
    
    % задаем внутренние узлы сплайна
    splineNodes(1) = defaultNodes(1);
    splineNodes(length(defaultNodes) + 1) = defaultNodes(length(defaultNodes));
    for i = 2:length(defaultNodes)
        splineNodes(i) = 0.5 * (defaultNodes(i-1) + defaultNodes(i));
    end
end

    