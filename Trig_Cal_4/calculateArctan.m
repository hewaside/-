function arctan_val = calculateArctan(x, n_terms,unit)
     % 初始化泰勒级数的和
    arctan_val = 0;
    
    % 使用泰勒级数计算arctan(x)，公式为：
    % arctan(x) = x - x^3/3 + x^5/5 - x^7/7 + ...
  
    for i = 0:n_terms
        sign = (-1)^(i);
        arctan_val = arctan_val + sign * x^(2*i + 1) / (2*i+1);
    end
    arctan_val = round(arctan_val * unit) / unit;

end