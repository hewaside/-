function arccos_val = calculateArccos(x, n_terms, unit)
     % 构建反正弦函数在x=0处的泰勒级数
    

      arcsin_val = 0;
    for i = 0:n_terms
        
        factorial_term1 = doubleFactorial(2*i - 1);
        factorial_term2 = doubleFactorial(2*i);
        term = x^(2*i + 1) / (2*i+1)* factorial_term1/ factorial_term2;
        arcsin_val = arcsin_val + term;
    end
    arccos_val = pi/2 - arcsin_val;
    arccos_val = round(arccos_val * unit) / unit;
    
end