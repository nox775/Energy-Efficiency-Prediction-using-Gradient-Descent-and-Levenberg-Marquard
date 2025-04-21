function dy = siglin_derv(z)
    a = 0.2;
    s = 1 ./ (1 + exp(-z));
    dy = s .* (1 - s) - a;
end