function res = f_gen(n,d,t,L)

res = zeros(d,n);
if t==0
    % stochastic
    offset = zeros(d,1);
    offset(1) = L;
    for i=1:n
        temp = randn(d,1)/4;
        if norm(temp)>1
            temp = temp/norm(temp);
        end
        res(:,i) = temp+ offset;
    end
elseif t==1
    % adversary
    F = orth_basis(n,d-1);
    for i=1:n
        res(:,i) = [L; sqrt(1-L^2)*F(:,i)];
    end
elseif t==-1
    %worst case
    res(1,1) = 0.9;
    for i = 2:n
        res(1,i) = (mod(i,2)-0.5)*2;
    end
else
    % mixture
    F1 = f_gen(n,d,0,L);
    F2 = f_gen(n,d,1,0);
    res = (1-t)*F1+ t*F2;
end