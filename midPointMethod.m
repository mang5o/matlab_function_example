function predXY = midPointMethod(func, startXVal, startYVal, stepSize, iter, varargin)
    % midPointMethod - ODE solving method
    %
    % Parameter
    %   func - function to solve
    %   startXVal, startYVal = initial values
    %   endXVal -> startXVal + stepSize*iter
    % Example
    %   midPointMethod(@(y,t) exp(0.1*t)*4 - y, 0, 0, 1,4)
    nowXVal = startXVal;
    nowYVal = startYVal;
    
    for i=1:iter
        tmpSlope = func(nowYVal, nowXVal, varargin{:});
        tmpXVal = nowXVal + stepSize/2;
        tmpYVal = nowYVal + tmpSlope*stepSize/2;
        nowSlope = func(tmpYVal, tmpXVal, varargin{:});
        nowXVal = nowXVal + stepSize;
        nowYVal = nowYVal + nowSlope*stepSize;
    end
    predXY = [nowXVal, nowYVal];
end
