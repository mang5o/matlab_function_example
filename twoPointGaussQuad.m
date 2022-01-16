function integral = twoPointGaussQuad(func, startVal, endVal, varargin)
    % twoPointGaussQuad - Guass Quadrature with Two-Point
    %
    % Example
    %   funcToIntegral = @(x) 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
    %   disp(twoPointGaussQuadAA(funcToIntegral, 0, 0.8));
    movedStartVal = (startVal+endVal)/2 - (endVal-startVal)/(2*sqrt(3));
    movedEndVal   = (startVal+endVal)/2 + (endVal-startVal)/(2*sqrt(3));
    integral = (func(movedStartVal,varargin{:}) + func(movedEndVal,varargin{:}))*(endVal-startVal)/2;
end