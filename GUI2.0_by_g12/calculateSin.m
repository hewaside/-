function sin_val = calculateSin(rad)
    sin_val = 0;
    rad_lim = mod(rad,2*pi);
    for i = 0:100
        sign = (-1)^(i);
        fact = factorial(2*i+1);
        sin_val = sin_val + sign * rad_lim^(2*i+1) / fact;
    end
    sin_val = round(sin_val * 1000) / 1000
end