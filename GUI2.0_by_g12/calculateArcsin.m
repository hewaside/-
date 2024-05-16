function arcsin_val = calculateArcsin(x)
     % 构建反正弦函数在x=0处的泰勒级数
    
    
    if x==1
        arcsin_val=pi/2;
        
    elseif x==-1
        arcsin_val=-pi/2;
       
    else
        arcsin_val = 0;
        for i = 0:50
        factorial_term1 = factorial(2*i);
        factorial_term2 = factorial(i);
        term = x^(2*i + 1) * factorial_term1 / (2*i+1) / ((factorial_term2)^2) /(4^i);
        arcsin_val = arcsin_val + term;
        end
        arcsin_val = round(arcsin_val *1000) / 1000;
    end
end