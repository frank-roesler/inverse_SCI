function integral = I(a,b,x)
% computes integral of cos(ax)cos(bx) from 0 to 1.
% a, b, x must be scalars
    if a~=b
        integral = ((a*sin(a*x))*cos(b*x) - cos(a*x)*(b*sin(b*x)))/(a^2-b^2);
    else
        integral = 0.5*x+sin(2*a*x)/(4*a);
    end
end