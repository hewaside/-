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
            if mod(deg,90) >= 0
                fprintf('您的输入大于pi/2，tan不存在。\n');     
            else
                 tan_val = calculateTan(rad,100 ,unit);
                 fprintf('Tan: %f\n', tan_val);
            end            
            % 不计算反正弦和反正切
            fprintf('您的输入为角度，无法计算反正弦和反正切。\n');

        case '2'
            % 用户输入数值
            num = str2double(input('请输入一个数值：', 's'));

            % 计算反正弦和反正切
            if abs(num) <= 1
                arcsin_val = calculateArcsin(num, 100);
                arcsin_deg = arcsin_val * 180 / pi;
                fprintf('Arcsin: %.2f degrees\n', arcsin_deg);

                arccos_val = calculateArccos(num, 100);
                arccos_deg = arccos_val * 180 / pi;
                fprintf('Arccos: %.2f degrees\n', arccos_deg);


                arctan_val = calculateArctan(num, 100);
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
