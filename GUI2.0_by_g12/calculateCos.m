function cos_val = calculateCos(rad)
    cos_val = 0;
    rad_lim = mod(rad,2*pi);    
    for i = 0:100
        sign = (-1)^(i);
        fact = factorial(2*i);
        cos_val = cos_val + sign * rad_lim^(2*i)/ fact;
    end
    cos_val = round(cos_val * 1000) / 1000;
end