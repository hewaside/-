function arctan_val = calculateArctan(x, n_terms,unit)
    if abs(x) <= 1
        arctan_val = calculateArctan_tmp(x, n_terms,unit);
    elseif x > 1
        arctan_val = pi/2-calculateArctan_tmp(1/x, n_terms, unit);   
    elseif x < -1
        arctan_val = -(pi/2-calculateArctan_tmp(-1/x, n_terms, unit));   
    end
end