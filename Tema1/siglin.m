function y = siglin(z)
    a = 0.2;
    y = 1 ./ (1 + exp(-z)) - a .* z;
end