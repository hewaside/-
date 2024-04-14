
function tan_val = calculateTan(x, n_terms,unit)
     % 构建反正弦函数在x=0处的泰勒级数
    
        x_lim = mod(x,pi/2);
        if x > pi/2
            x = x - pi; 
        elseif x < -pi/2
            x = x + pi;
        end



            in_range = true; % 已经在(-90, 90)区间内
            tan_val = 0;
            bernoulli_arr = bernoulli(2:2:2*n_terms);
            for i = 1:n_terms
                tan_val = tan_val + ((-1)^(i+1))*((2^(2*i)-1))*2^(2*i)/factorial(2*i)*bernoulli_arr(i)*x^(2*i-1);
            end
                tan_val = round(tan_val * unit) / unit;



    
    
end

