function cos_val = calculateCos(rad, n_terms, unit)
    cos_val = 0;
    rad_lim = mod(rad,2*pi);    
    for i = 0:n_terms
        sign = (-1)^(i);
        fact = factorial(2*i);
        cos_val = cos_val + sign * rad_lim^(2*i)/ fact;
    end
    cos_val = round(cos_val * unit) / unit;
end