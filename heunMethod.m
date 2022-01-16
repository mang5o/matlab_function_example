function predXY = heunMethod(func, startXVal, startYVal, stepSize, iter, varargin)
    % heunMethod - ODE solving method
    %
    % Parameter
    %   func - function to solve
    %   startXVal, startYVal = initial values
    %   endXVal -> startXVal + stepSize*iter
    % Example
    %   heunMethod(@(y,t) exp(0.1*t)*4 - y, 0, 0, 1,4)
    nowXVal = startXVal;
    nowYVal = startYVal;
    
    for i=1:iter
        tmpSlope = func(nowYVal, nowXVal, varargin{:});
        tmpXVal = nowXVal + stepSize;
        tmpYVal = nowYVal + tmpSlope*stepSize;
        tmpNextSlope = func(tmpYVal, tmpXVal, varargin{:});
        nowSlope = (tmpSlope + tmpNextSlope)/2;
        nowXVal = nowXVal + stepSize;
        nowYVal = nowYVal + nowSlope*stepSize;
    end
    predXY = [nowXVal, nowYVal];
end
