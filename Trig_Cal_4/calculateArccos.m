function arccos_val = calculateArccos(x, n_terms, unit)
     % 构建反正弦函数在x=0处的泰勒级数
    

    if x==1
        arccos_val=0;
        
    elseif x==-1
        arccos_val=pi;
        
    else
        arcsin_val = 0;
        for i = 0:n_terms
        factorial_term1 = factorial(2*i);
        factorial_term2 = factorial(i);
        term = x^(2*i + 1) * factorial_term1 / (2*i+1) / ((factorial_term2)^2) /(4^i);
        arcsin_val = arcsin_val + term;
        end
        arcsin_val = round(arcsin_val * unit) / unit;
        arccos_val = pi/2 - arcsin_val;
        arccos_val = round(arccos_val * unit) / unit;
    end
   
    
end