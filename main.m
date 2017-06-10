clear;
d = 4;
n = 20000;%2500;
L = 0.0;
m = 100;

%load('A.mat')
A = eye(d);
range = 1/min(svd(A))^2;

% FTL: min_w <w, -F> => min_v <A^(-1)v, -F> => v = A'^(-1)F /norm
% FTRL: min_w <w, -F> + eta/2 \|w\|^2 => min_v <A^(-1)v, -F> + eta/2 (v' *
% A'^(-1)*A^(-1)*v)

% for AB_prod
coef = 0.45; %0.5*sqrt(log(2*range*n)/(2*range*n));

%initialization
regret_FTL = zeros(n-1,m);
regret_FTRL = zeros(n-1,m);
regret_AB = zeros(n-1,m);
regret_Shrink = zeros(n-1,m);


for j=1:m
    c_FTRL = coef;
    c_FTL = 1-c_FTRL;
    %generate adversary
    F = f_gen(n,d, -1, L); %0: stochastic; 1: adversary; (0,1):mixture; -1:worst case

    w_FTL = zeros(d,1);
    reward_FTL  = 0;
    w_FTRL = zeros(d,1);
    reward_FTRL  = 0;
    w_AB = zeros(d,1);
    reward_AB = 0;
    w_Shrink = zeros(d,1);
    reward_Shrink = 0;
    
    acc_F = zeros(d,1);
    for i=1:n
        eta = sqrt(i);
        acc_F = acc_F + F(:,i);
        reward_FTL = reward_FTL + w_FTL'*F(:,i);
        reward_FTRL = reward_FTRL + w_FTRL'*F(:,i);
        reward_AB = reward_AB + w_AB'*F(:,i);
        reward_Shrink = reward_Shrink + w_Shrink'*F(:,i);
        temp_FTL =  w_FTL'*F(:,i);
        temp_FTRL = w_FTRL'*F(:,i);

        if norm(acc_F)==0
            w_opt = zeros(d,1);
        else
            temp = A'\acc_F;
            w_opt = temp / norm(temp);
            w_opt = A\w_opt;
        end
        regret_FTL(i,j) = w_opt'*acc_F - reward_FTL; 
        regret_FTRL(i,j) = w_opt'*acc_F - reward_FTRL; 
        regret_AB(i,j) = w_opt'*acc_F - reward_AB;
        regret_Shrink(i,j) = w_opt'*acc_F - reward_Shrink;
        

        w_FTL = w_opt;
        w_Shrink = sqrt(norm(acc_F)^2/(norm(acc_F)^2+i+2))*w_opt;
        
        % compute solution of FTRL
        w_FTRL = A*acc_F/eta;
        if norm(w_FTRL)>1
            %w_FTRL = -solveFTRL(A,acc_F, eta);
            w_FTRL = w_FTRL/norm(w_FTRL,2);
        end
        w_FTRL = A\w_FTRL;

        % generate AB_prod prediction
        [c_FTRL, c_FTL, w_AB] = AB_prod(c_FTRL, c_FTL, temp_FTRL, temp_FTL, w_FTRL, w_FTL, i, range);
        if mod(i,100)==0
            [j,i/100,c_FTRL/(c_FTRL+c_FTL), c_FTL/(c_FTRL+c_FTL)]
        end
    end
end
save('Worst-case_unit.mat');
