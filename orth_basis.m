function res = orth_basis(n,d)

res = zeros(d,n);
res(:,1) =randn(d,1);
while norm(res(:,1))==0
    res(:,1) =randn(d,1);
end
res(:,1)  =res(:,1) / norm(res(:,1));
F = res(:,1);

for i=2:n
    if norm(F)==0
        v = randn(d,1);
        while norm(v)==0
            v =randn(d,1);
        end
        v =v / norm(v);
    else
        v = randn(d,1);
        while norm(v)==0
            v = randn(d,1);
        end
        v = v - (v'*F)/norm(F)^2 * F;
        v = v/norm(v);
    end
    res(:,i) = v;
    F  = F + v;
end