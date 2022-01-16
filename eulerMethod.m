function predXY = eulerMethod(func, startXVal, startYVal, stepSize, iter, varargin)
    % eulerMethod - ODE solving method
    %
    % Parameter
    %   func - function to solve
    %   startXVal, startYVal = initial values
    %   endXVal -> startXVal + stepSize*iter
    % Example
    %   eulerMethod(@(y,t) exp(0.1*t)*4 - y, 0, 0, 1,4)
    nowXVal = startXVal;
    nowYVal = startYVal;
    
    for i=1:iter
        nowSlope = func(nowYVal, nowXVal, varargin{:});
        nowXVal = nowXVal + stepSize;
        nowYVal = nowYVal + nowSlope*stepSize;
    end
    predXY = [nowXVal, nowYVal];
end
