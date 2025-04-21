function [res] = gradient_x(A, X, x, e)

    N = size(A, 1);

    activare = siglin(A * X);         % N x m
    predictie = activare * x;         % N x 1

    eroare = predictie - e;           % N x 1

    res = (1 / N) * activare' * eroare;  % m x 1

end
