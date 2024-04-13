    clear; close all; clc;
    % 请求用户输入类型
    input_type = input('请输入1表示角度，输入2表示数值：', 's');
    switch input_type
        case '1'
            input_unit = str2double(input('请输入保留小数位数：', 's'));
            unit = 10^input_unit;   
            % 用户输入角度
            deg = str2double(input('请输入一个角度（以度为单位）：', 's'));
            rad = deg * pi / 180;

            % 计算正弦、余弦和正切
            sin_val = calculateSin(rad,100,unit);
            cos_val = calculateCos(rad,100,unit);

            fprintf('Sin: %.*f\n',input_unit,sin_val);
            fprintf('Cos: %.*f\n',input_unit,cos_val);
            if mod(deg,90)==0 && mod(deg/90,2) ~= 0 
                fprintf('此时Tan不存在。\n');     
            else
                 tan_val = calculateTan(rad,100 ,unit);
                 fprintf('Tan: %.*f\n', input_unit,tan_val);
            end            
            % 不计算反正弦、反余弦和反正切
            fprintf('您的输入为角度，无法计算反正弦、反余弦和反正切。\n');
            
        case '2'
            % 用户输入数值
            input_unit = str2double(input('请输入保留小数位数：', 's'));
            unit = 10^input_unit;

            % 用户输入数值
            num = str2double(input('请输入一个数值：', 's'));

            % 计算反正弦、反余弦和反正切
            if abs(num) <= 1
                arcsin_val = calculateArcsin(num, 50,unit);
                arcsin_deg = arcsin_val * 180 / pi;
                fprintf('Arcsin: %.*f degrees\n', input_unit,arcsin_deg);
            
                arccos_val = calculateArccos(num, 50,unit);
                arccos_deg = arccos_val * 180 / pi;
                fprintf('Arccos: %.*f degrees\n',input_unit,arccos_deg);


                arctan_val = calculateArctan(num, 100, unit);
                arctan_deg = arctan_val * 180 / pi;
                fprintf('Arctan: %.*f degrees\n',input_unit, arctan_deg);
            elseif num>1
                arctan_val = calculateArctan(num, 100, unit);   
                arctan_deg = arctan_val * 180 / pi;               
                fprintf('由于输入值不在[-1, 1]范围内，无法计算反正弦和反余弦。\n');
                fprintf(' Arctan: %.*f degrees\n',input_unit, arctan_deg);
            elseif num<-1
                arctan_val = calculateArctan(num, 100, unit);  
                arctan_deg = arctan_val * 180 / pi;               
                fprintf('由于输入值不在[-1, 1]范围内，无法计算反正弦和反余弦。\n');
                fprintf(' Arctan: %.*f degrees\n',input_unit, arctan_deg);
            end

            % 不计算正弦、余弦和正切
            fprintf('由于您输入的是数值，无法计算正弦、余弦和正切。\n');

        otherwise
            fprintf('无效的输入类型，请输入1或2。\n');
    end
