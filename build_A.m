function A = build_A(x,n,lambda,alpha)
% Assembles matrix A needed to compute u (cf. compute_u.m).
    N = length(lambda);
    if x==0
        A = zeros(2*N);
    else
%         Upper left block:
        A11 = zeros(N);
        for i=1:N
            for j=1:N
                A11(i,j) = 1/sqrt(alpha(i)*alpha(j)) * I(lambda(i),lambda(j),x);
            end
        end
        
%         Lower right block:
        A22 = zeros(N);
        for i=2:N
            for j=2:N
                A22(i,j) = 2/pi * I(n(i),n(j),x);
            end
        end
        zero_column = zeros(1,N);
        zero_column(1) = x/pi;
        for i=2:N
            zero_column(i) = sqrt(2)/pi * sin(n(i)*x)/n(i);
        end
        A22(1,:) = zero_column;
        A22(:,1) = zero_column;

%         Upper right block:
        A12 = zeros(N);
        for i=1:N
            for j=2:N
                A12(i,j) = sqrt(2/(alpha(i)*pi)) * I(lambda(i),n(j),x);
            end
        end
        zero_column = zeros(1,N);
        for i=1:N
            zero_column(i) = 1/sqrt(pi*alpha(i)) * sin(lambda(i)*x)/lambda(i);
        end
        A12(:,1) = zero_column;

        A = [-A11 , -A12; 
              A12',  A22];
    end
end














