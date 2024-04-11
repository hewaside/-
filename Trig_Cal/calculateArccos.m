function arccos_val = calculateArccos(x, n_terms)
     % 构建反正弦函数在x=0处的泰勒级数
    
    arccos_val = pi/2 - calculateArcsin(x, n_terms);
   
end