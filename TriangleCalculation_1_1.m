function TriangleCalculation_1_1()
    % 请求用户输入类型
    input_type = input('请输入1表示角度，输入2表示数值：', 's');

    switch input_type
        case '1'
            input_unit = str2double(input('请输入保留小数位数：', 's'));
            unit = 10^input_unit;


            % 用户输入角度
            deg = str2double(input('请输入一个角度（以度为单位）：', 's'));
            rad = deg * pi / 180;

            % 计算正弦和余弦
            sin_val = calculateSin(rad,100 ,unit);
            cos_val = calculateCos(rad,100 ,unit);


            fprintf('Sin: %f\n', sin_val);
            fprintf('Cos: %f\n', cos_val);

            % 不计算反正弦和反正切
            fprintf('由于您输入的是角度，无法计算反正弦和反正切。\n');

        case '2'
            % 用户输入数值
            num = str2double(input('请输入一个数值：', 's'));

            % 计算反正弦和反正切
            if abs(num) <= 1
                arcsin_val = calculateArcsin(num, unit);
                arcsin_deg = arcsin_val * 180 / pi;
                fprintf('Arcsin: %.2f degrees\n', arcsin_deg);

                arctan_val = calculateArctan(num, unit);
                arctan_deg = arctan_val * 180 / pi;
                fprintf('Arctan: %.2f degrees\n', arctan_deg);
            else
                fprintf('由于输入值不在[-1, 1]范围内，无法计算反正弦。\n');
                fprintf(' Arctan: %.2f degrees\n', calculateArctan(num, 10) * 180 / pi);
            end

            % 不计算正弦和余弦
            fprintf('由于您输入的是数值，无法计算正弦和余弦。\n');

        otherwise
            fprintf('无效的输入类型，请输入1或2。\n');
    end
end


function sin_val = calculateSin(rad, n_terms, unit)
    sin_val = 0;
    for i = 0:n_terms
        sign = (-1)^(i);
        fact = factorial(2*i+1);
        sin_val = sin_val + sign * rad^(2*i+1) / fact;
    end
    sin_val = round(sin_val * unit) / unit;
end

function cos_val = calculateCos(rad, n_terms, unit)
    cos_val = 0;
    for i = 0:n_terms
        sign = (-1)^(i);
        fact = factorial(2*i);
        cos_val = cos_val + sign * rad^(2*i)/ fact;
    end
    cos_val = round(cos_val * unit) / unit;
end

function arcsin_val = calculateArcsin(x, n_terms)
     % 构建反正弦函数在x=0处的泰勒级数
    arcsin_val = 0;
    for i = 0:n_terms
        
        factorial_term1 = doubleFactorial(2*i - 1);
        factorial_term2 = doubleFactorial(2*i);
        term = x^(2*i + 1) / (2*i+1)* factorial_term1/ factorial_term2;
        arcsin_val = arcsin_val + term;
    end
   
end

function arctan_val = calculateArctan(x, n_terms)
     % 初始化泰勒级数的和
    arctan_val = 0;
    
    % 使用泰勒级数计算arctan(x)，公式为：
    % arctan(x) = x - x^3/3 + x^5/5 - x^7/7 + ...
    for i = 0:n_terms
        sign = (-1)^(i);
        arctan_val = arctan_val + sign * x^(2*i + 1) / (2*i+1);
    end
    
end

function dfact = doubleFactorial(n)
    % 初始化双阶乘结果
    dfact = 1;
    
    % 判断输入值n的奇偶性
    if mod(n, 2) == 0
        % 对于偶数n
        for i = 2 : 2 : n
            dfact = dfact * i;
        end
    else
        % 对于奇数n
        for i = 1 : 2 : n - 1
            dfact = dfact * i;
        end
    end
end