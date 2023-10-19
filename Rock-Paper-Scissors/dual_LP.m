n = 3;
fx = [1; 1; 1];
fy = -fx;
A = [0 1 -1; -1 0 1; 1 -1 0];
b = [1; 1; 1];
x = linprog(fx, [-(A + 1)'; -eye(n)], [-b; zeros(n, 1)])
y = linprog(fy, [A + 1; -eye(n)], [b; zeros(n, 1)])
