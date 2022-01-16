function [decimalNum] = binaryToDecimal(inputStr)
    % make_decimal - A function that converts binary values into decimal values.
    %     After determining that the value of the binary number has no decimal point and calculating it, the total calculated value is divided according to the location of the decimal point.
    % 
    % Parameter
    %   inputStr : input string
    
    [fp,len,rmPoint] = makeInput(inputStr);
    divider = 1; % position of decimal point (for divide)
    if (fp~=0)
        divider = 2^(len-fp+1);
    end
    decimalNum = 0;
    for i=0:len-1
        if(strcmp(rmPoint(len-i),'1'))
            decimalNum = decimalNum + 2^(i);
        end
    end
    decimalNum = decimalNum/divider;
    if(inputStr(1)=='-')
        decimalNum = decimalNum*(-1);
    end
end

function [fp, len, rmPoint] = makeInput(inputStr)
% make_input
    % function to remove decimal point
% output:
    % fp       : index of floating point
    % len      : length of input (without decimal point)
    % rmPoint  : input string (without decimal point)
    
    len = strlength(inputStr);
    fp  = 0; 
    for i=1:len
        if(strcmp(inputStr(i),'.'))
            fp = i;
            break;
        end
    end
    rmPoint = inputStr;
    if fp>0
        rmPoint = append(inputStr(1:fp-1),inputStr(fp+1:len));
        len = len-1;
    end
end