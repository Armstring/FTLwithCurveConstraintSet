function x = solveFTRL(A,acc_F, eta)

L = A\acc_F;
Q = eta*inv(A)*inv(A);
H = eye(4);

%lambda=0;
%[val, grad] = eVal(eta,1./diag(E),L,lambda);
%while val>1e-6
    %val
%    lambda = lambda - val/grad;
%    [val, grad] = eVal(eta,diag(E),L,lambda);
%end
options = optimset('Algorithm','interior-point','Display','off');
%    'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true,...
%    'HessianFcn',@(x,lambda)quadhess(x,lambda,Q,H));
fun = @(x)quadobj(x,Q,L);
nonlconstr = @(x)quadconstr(x,H);
x0 = [0,0,0,0]';
[x,fval,eflag,output,lambda] = fmincon(fun,x0,...
    [],[],[],[],[],[],nonlconstr,options);
%fval

    
    
    
    function [y,grady] = quadobj(x,Q,f)
        y = 1/2*x'*Q*x + f'*x;
        if nargout > 1
            grady = Q*x + f;
        end
    function [y,yeq,grady,gradyeq] = quadconstr(x,H)
        y = 1/2*x'*H*x-1/2;
        yeq= [];
        if nargout > 2
            grady = H*x;
            gradyeq = [];
        end
    