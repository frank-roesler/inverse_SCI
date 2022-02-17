function integral = I(a,b,x)
% computes integral of cos(as)cos(bs) from 0 to x.
% a, b, x must be scalars
    if a~=b
        integral = ((a*sin(a*x))*cos(b*x) - cos(a*x)*(b*sin(b*x)))/(a^2-b^2);
    elseif a~=0
        integral = 0.5*x+sin(2*a*x)/(4*a);
    else
        integral = x;
    end
end