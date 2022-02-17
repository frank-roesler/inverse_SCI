function b = build_b(x,n,lambda,alpha, A)
% Computes right hand side b for matrix equation (I-A)c = b.
    BC1 = -1./sqrt(alpha) .* cos(lambda*x);
    BC2 = sqrt(2/pi) .* cos(n*x);
    BC2(1) = 1/sqrt(pi);
    BC = [BC1.'; BC2.'];
    
    b = A*BC;
end




