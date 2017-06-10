function [c_A, c_B, w_AB] = AB_prod(c_A, c_B, r_A, r_B, w_A, w_B, n, range)

eta = 5*sqrt(1/n);
loss_A = - r_A;
loss_B = - r_B;
diff = (loss_B-loss_A)/(range);
c_A = c_A*(1+ eta*diff);
if c_A/c_B > 100000
    c_A = 1;
    c_B = 0;
end

if c_B/c_A > 100000
    c_B = 1;
    c_A = 0;
end

prob = unifrnd(0,1);
if prob> (c_A/(c_A+c_B))
    w_AB = w_B;
else
    w_AB = w_A;
end
%w_AB = (c_A/(c_A+c_B))*w_A+(c_B/(c_A+c_B))*w_B;
