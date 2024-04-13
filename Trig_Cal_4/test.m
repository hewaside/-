x=360;
in_range = false;
while ~in_range
    if x > 90
        x = x - 180; % 减去180°（相当于加或减90°两次）
    elseif x < -90
        x = x + 180;
    else
        in_range = true; % 已经在(-90, 90)区间内
    end
end