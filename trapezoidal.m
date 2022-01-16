function integralVal = trapezoidal(f, scopeStart, scopeEnd, n, varargin)
    % trapezoidal - function that uses trapezoidal law to obtain an
    % integral value
    % 
    % Parameter
    %   f = function
    %   scopeStart & scopeEnd = scope to integral
    %   n = number of pieces
    %
    % Example
    %   function y = func(x, varargin)
    %       y = 3^x;
    %   end
    %   trapezoidal(@func, 3, 4);
    scopes = linspace(scopeStart,scopeEnd,n+1);
    integralVal = 0;
    for i = 1:n
        integralVal = integralVal + trapezoidalEach(f, scopes(i), scopes(i+1), varargin);
    end
end

function trapeVal = trapezoidalEach(f, scopeStart, scopeEnd, varargin)
    trapeVal = (scopeEnd-scopeStart) * (f(scopeStart,varargin{:}) + f(scopeEnd,varargin{:}))/2;
end

