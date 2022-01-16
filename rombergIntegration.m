function integral = rombergIntegration(func, initN, intRatio, startVal, endVal, iterVal, varargin)
    % rombergIntegral - Romberg Integral
    % 
    % Parameter
    %   func                = function to integral
    %   initN               = first (I11) number of scopes
    %   intRatio            = interval multiple ratio
    %                if initRatio is 2, N will be change to N/2
    %   startVal, endVal    = scope to integral
    %   iterVal             = how many multiple "intRatio" at first stage
    %
    % Example
    %   func = @(x) x.^3 + x.^2 + x.^1;
    %   disp(rombergIntegralA(func, 1,2,0,4,10));
    
    
    integral = zeros(iterVal);
    nowN = initN;
    for i=1:iterVal
        integral(i,1) = trapezoidal(func, startVal, endVal, nowN, varargin{:});
        nowN = nowN * intRatio;
    end
    for i=2:iterVal
        for j=1:iterVal-i+1
            integral(j,i) = richardsonExtrapolation(intRatio, 1, integral(j,i-1), integral(j+1,i-1));
        end
    end
end

function integralVal = trapezoidal(f, scopeStart, scopeEnd, n, varargin)
    scopes = linspace(scopeStart,scopeEnd,n+1);
    integralVal = 0;
    for i = 1:n
        integralVal = integralVal + (scopes(i+1)-scopes(i)) * (f(scopes(i),varargin{:}) + f(scopes(i+1),varargin{:}))/2;
    end
end

function integral = richardsonExtrapolation(h1,h2,itgrH1, itgrH2)
    % richardsonExtrapolation
    %
    % Parameter
    %   itgrH1 = I(h1)
    %   itgrH2 = I(h2)
    integral = itgrH2 + (itgrH2 - itgrH1)/((h1/h2)^2-1);
end