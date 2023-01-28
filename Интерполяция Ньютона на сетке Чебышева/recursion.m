function ultimate_dif = recursion(i,n,nodesCheb)
    if i == 1
        ultimate_dif = F(nodesCheb(n+1));
    else
        ultimate_dif = (recursion(i-1,n,nodesCheb) - recursion(i-1,n-1,nodesCheb))/(nodesCheb(n+1) - nodesCheb(n+2-i));
    end
end