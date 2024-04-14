function [errorrate] = test_Trig(Trig_type, test_num, unit)
% 将所编写三角函数与matlab系统函数进行比较，计算误差
% Trig_type——三角函数种类：1.sin 2.cos 3.tan 4.arcsin 5.arccos 6.arctan
% test_num——测试样点数
% unit——保留小数位数
%     errorrnum = 0;
    unit10 = 10^unit;
    rand_input = (rand(1,test_num)-0.5)*2;  
    switch Trig_type 
        case 1
            rand_input_sin = rand_input*pi;
            for kin = 1:test_num
                oursin = calculateSin(rand_input_sin(kin),100,unit10);
                syssin = sin(rand_input_sin(kin));
                errorrate_arr(kin) = abs(oursin-syssin)/abs(syssin);
            end 

        case 2
            rand_input_cos = rand_input*pi;
            for kin = 1:test_num
                ourcos = calculateCos(rand_input_cos(kin),100,unit10);
                syscos = cos(rand_input_cos(kin));
                errorrate_arr(kin) = abs(ourcos-syscos)/abs(syscos);
            end 

        case 3
            rand_input_tan = rand_input*pi/2;
            for kin = 1:test_num
                ourtan = calculateTan(rand_input_tan(kin),100,unit10);
                systan = tan(rand_input_tan(kin));
                errorrate_arr(kin) = abs(ourtan-systan)/abs(systan);
            end    
        case 4
              rand_input_arcsin = rand_input;
            for kin = 1:test_num
                ourarcsin = calculateArcsin(rand_input_arcsin(kin),50,unit10);
                sysarcsin = asin(rand_input_arcsin(kin));
                errorrate_arr(kin) = abs(ourarcsin-sysarcsin)/abs(sysarcsin);
            end    
        case 5
            rand_input_arccos = rand_input;
            for kin = 1:test_num
                ourarccos = calculateArccos(rand_input_arccos(kin),50,unit10);
                sysarccos = acos(rand_input_arccos(kin));
                errorrate_arr(kin) = abs(ourarccos-sysarccos)/abs(sysarccos);
            end  
        case 6
            rand_input_arctan = rand_input;
            for kin = 1:test_num
                ourarctan = calculateArctan(rand_input_arctan(kin),100,unit10);
                sysarctan = atan(rand_input_arctan(kin));
                errorrate_arr(kin) = abs(ourarctan-sysarctan)/abs(sysarctan);
            end                
    end
    errorrate = sum(errorrate_arr)/length(errorrate_arr);
    
end