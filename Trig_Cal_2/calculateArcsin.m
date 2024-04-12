function arcsin_val = calculateArcsin(x, n_terms, unit)
     % 构建反正弦函数在x=0处的泰勒级数
    
    arcsin_val = 0;
    for i = 0:n_terms
        
        factorial_term1 = doubleFactorial(2*i - 1);
        factorial_term2 = doubleFactorial(2*i);
        term = x^(2*i + 1) / (2*i+1)* factorial_term1/ factorial_term2;
        arcsin_val = arcsin_val + term;
    end
    arcsin_val = round(arcsin_val * unit) / unit;

end