function [Xpoly,Ypoly, nodesCheb] = interNewton(ab,n)
    for i = 1:n+1
        nodesCheb(i) = (ab(1)+ab(2))/2 + ((ab(2)-ab(1))/2) * cos((pi*(2*(i-1)+1) / (2*(n+1))));
    end
    P = 1;
    sum = 0;
    count = 0;
    for i = 1:n+1        
        rec(i) = recursion(i,n,nodesCheb);
    end
%     for k = 1:n+1
%         for i = 1:n
%             for j = 1:n
%                 if i==j
%                     continue;
%                 end
%                 P = P * (nodesCheb(i) - nodesCheb(j));
%             end
%             sum = sum + F(nodesCheb(i)) / P;
%         end
%         rec(k) = sum;
%     end
%     P = 1;
%     sum = 0;
    for x = ab(1):0.002:ab(2)
        count = count + 1;
        for i = 1:n+1
            for j = n+3-i:n+1
                P = P*(x-nodesCheb(j));
            end
            sum = sum + P*rec(i);
            P = 1;
        end
        Xpoly(count) = x;
        Ypoly(count) = sum;
        sum = 0;
    end
   for i = 1:n+1
       Xpoly(count+i) = nodesCheb(i);
       Ypoly(count+i) = F(nodesCheb(i));
   end
   Xpoly = sort(Xpoly);
   Ypoly = sort(Ypoly);
end
