function [res] = gradient_x_big(A, X, x, e)
    [N, ~] = size(A);
    
    Z = A * X;                                % N x m
    G = siglin(Z);                            % N x m
    dG = siglin_derv(Z);                      % N x m
    y_pred = G * x;                           % N x 1
    err = y_pred - e;                         % N x 1
    
    % Se multiplică fiecare coloană cu vectorul err → Hadamard produs
    temp = (err .* (dG * diag(x')));          % N x m
    
    res = (A') * temp;                        % (D x m)
    res = res / N;
end
