function res = loss(e, y)
    N = length(y);
    res = (1 / (2 * N)) * sum((e - y).^2);
end
