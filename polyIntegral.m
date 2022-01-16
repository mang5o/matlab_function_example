function integralVal = polyIntegral(scope,coefficients)
    % polyIntegral - polynomial integral function
    %
    % Parameter
    %       scope        = vector with a starting point and an ending point.
    %       coefficients = coefficient vector
    integralVal = 0;
    nowOrder = 0;
    for coefficient = coefficients
        nowOrder = nowOrder+1;
        nowDiff = coefficient*(scope(2).^nowOrder - scope(1).^nowOrder)/nowOrder;
        integralVal = integralVal + nowDiff;
    end
end