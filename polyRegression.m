function coefficientArray = polyRegression(xyArray, order)
    % polyRegression - Polynomial Regression
    %   
    %   Parameter
    %       xyArray  : matrix (xy values)
    %       order    : order of polynomial to fitting
    %
    %   Example
    %       xy = [3 1.6; 4 3.6; 5 4.4; 7 3.4; 8 2.2; 9 2.8; 11 3.8; 12 4.6];
    %       polyRegression(xy, 3);

    if(2*order>size(xyArray,1))
        error('unvalid m&n input');
    end
    fprintf('m = %d\tn = %d\n', order, size(xyArray,1));
    
    % sigma X array (to make N array)
    sigmaX = [size(xyArray,1)];
    for i=1:size(xyArray,1)
        nowSigma = 0;
        for elem=1:size(xyArray,1)
            nowSigma = nowSigma + power(xyArray(elem,1), i);
        end
        sigmaX = [sigmaX nowSigma]; 
    end
    
    % Create a matrix on the right side of a equation.
    rightValues    = [];
    for i=1:order+1
        nowRight = 0;
        for elem=1:size(xyArray,1)
            nowRight = nowRight + (power(xyArray(elem,1), i-1) * xyArray(elem,2));
        end 
        rightValues = [rightValues; nowRight];
    end
    
    % N,r,a
    N = [];
    whileCount = 0;
    while(true)
        tmpN = [];
        for i=0:order
            tmpN = [tmpN sigmaX(whileCount + i + 1)];
        end
        N = [N; tmpN];
        whileCount = whileCount+1;
        if(whileCount>order)
            break
        end
    end
    
    r = rightValues;
    a = N\r; % left division
    
    % Calculate Sr (sum of the squares of the residuals)
    Sr = 0;
    for i=1:size(xyArray,1)
        tmpSr = xyArray(i,2);
        for orderPtr=1:size(a)
            if(orderPtr>1)
                tmpSr = tmpSr - a(orderPtr)*power(xyArray(i,1),orderPtr-1);
            end
            if(orderPtr==1)
                tmpSr = tmpSr - a(orderPtr);
            end
        end
        Sr = Sr + power(tmpSr,2);
    end
    
    % Calculate S(y/x)
    Syx = sqrt(Sr/(size(xyArray,1)-order-1));
    
    % Calculate error
    yError = [];
    for i=1:size(xyArray,1)
        nowX = xyArray(i,1);
        nowY = xyArray(i,2);
        calXArray = [];
        for tmp_order=0:order
            calXArray = [calXArray; power(nowX,tmp_order)];
        end
        cal_y = nowY - a.'*calXArray;
        yError = [yError power(cal_y,2)];
    end
    yDiffSum = sum(yError);
    
    sumY = 0;
    for i=1:size(xyArray,1)
        sumY = sumY + xyArray(i,2);
    end
    avrY = sumY / size(xyArray,1);
    sumYErr = 0;
    for i=1:size(xyArray,1)
        sumYErr = sumYErr + power(xyArray(i,2)-avrY,2);
    end
    
    % Calculate r (r^2)
    float_r_pow = (sumYErr-yDiffSum)/sumYErr;
    float_r = sqrt(float_r_pow);
    
    % print output
    fprintf('y \t\t= ');
    for i=1:size(a)
        if(a(i)>0 && i>1)
            fprintf(' + ');
        end
        fprintf('%f',a(i));
        if(i==2)
            fprintf('x');
        end
        if(i>2)
            fprintf('x^%d',i-1);
        end
    end
    fprintf('\n');
    fprintf('Sy/x \t= %f\n',Syx);
    fprintf('r^2 \t= %f\n', float_r_pow);
    fprintf('r \t\t= %f\n', float_r);
    
    % return coefficients
    coefficientArray = a;
end


% built-in function
%   linregr(x,y)
%       x,y : vectors
%   polyfit(x,y,n)
%       x,y : vectors
%       n   : the order of the polynomial function
