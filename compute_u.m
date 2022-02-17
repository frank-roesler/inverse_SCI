function u = compute_u(x,lambda,alpha)
% Computes the integral u of the potential from the eigenvalues lambda and
% norming constants alpha using.
    N = length(lambda);
    n = 0:N-1;
    A = build_A(x,n,lambda,alpha);
    b = build_b(x,n,lambda,alpha,A);
    c = (eye(size(A))-A)\b;

    % Evaluate functions at y=x:
    f1 = -(1./alpha*cos(lambda.'*x).^2 - 1/pi -2/pi*sum(cos(n(2:end)'*x).^2));
    Ai = 1./sqrt(alpha).*cos(lambda*x);
    C0 = sqrt(1/pi);
    Ci = sqrt(2/pi)*cos(n(2:end)*x);

    u = f1 + [Ai,C0,Ci]*c;
end