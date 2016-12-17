function sim = gaussianKernel(x1, x2, sigma)

% to colum vector
x1 = x1(:); x2 = x2(:);

sim = exp(-norm(x1 - x2)^2 / (2 * sigma ^ 2));

end