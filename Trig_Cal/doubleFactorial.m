function dfact = doubleFactorial(n)
    % 初始化双阶乘结果
    dfact = 1;
    
    % 判断输入值n的奇偶性
    if mod(n, 2) == 0
        % 对于偶数n
        for i = 2 : 2 : n
            dfact = dfact * i;
        end
    else
        % 对于奇数n
        for i = 1 : 2 : n - 1
            dfact = dfact * i;
        end
    end
end