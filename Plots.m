clear;
gap = 2000;%250;

if 1==0
    %%% Worst Case
%load('./Worst-case_unit.mat');
load('Worst-case_unit.mat');
regret_FTL_mean = mean(regret_FTL,2);
regret_FTRL_mean = mean(regret_FTRL,2);
regret_AB_mean = mean(regret_AB,2);
regret_Shrink_mean = mean(regret_Shrink,2);


regret_FTL_var = sqrt(var(regret_FTL'))';
regret_FTRL_var = sqrt(var(regret_FTRL'))';
regret_AB_var = sqrt(var(regret_AB'))';
regret_Shrink_var = sqrt(var(regret_Shrink'))';


subplot(1,2,2)
plot(log(1:(n)),log(regret_FTL_mean), 'b','LineWidth',1.5);
hold on;
plot(log(1:(n)),log(regret_FTRL_mean),'r','LineWidth',1.5);
hold on;
plot(log(1:(n)),log(regret_AB_mean),'k','LineWidth',1.5);
hold on;
plot(log(1:(n)),log(regret_Shrink_mean),'g','LineWidth',1.5);
hold on;
errorbar(log(1:250:(n)),log(regret_AB_mean(1:250:(n))), log(regret_AB_mean(1:250:(n)))- log(regret_AB_mean(1:250:(n))-regret_AB_var(1:250:(n))), log(regret_AB_mean(1:250:(n))+regret_AB_var(1:250:(n)))-log(regret_AB_mean(1:250:(n))), 'kx','LineWidth',1.5);
xlabel('\fontsize{20} log(n) ');
ylabel('\fontsize{20} log(Regret)');

if 1==1
subplot(1,2,1)
plot(sqrt(1:(n)),sqrt(regret_FTL_mean), 'b','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)),sqrt(regret_FTRL_mean),'r','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)),sqrt(regret_AB_mean),'k','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)),sqrt(regret_Shrink_mean),'g','LineWidth',1.5);
hold on;
errorbar(sqrt(1:250:(n)),sqrt(regret_AB_mean(1:250:(n))),sqrt(regret_AB_mean(1:250:(n)))- sqrt(regret_AB_mean(1:250:(n))-regret_AB_var(1:250:(n))), sqrt(regret_AB_mean(1:250:(n))+regret_AB_var(1:250:(n))) - sqrt(regret_AB_mean(1:250:(n))), 'kx','LineWidth',1.5);

xlabel('\fontsize{20} sqrt(n)');
ylabel('\fontsize{20} sqrt(Regret)');
end
end


if 1==1
    %%%Stoc or Adve
load('./Stoc_00_normalized_unit.mat');

regret_FTL_mean = mean(regret_FTL,2);
regret_FTRL_mean = mean(regret_FTRL,2);
regret_AB_mean = mean(regret_AB,2);
regret_Shrink_mean = mean(regret_Shrink,2);


regret_FTL_var = sqrt(var(regret_FTL'));
regret_FTRL_var = sqrt(var(regret_FTRL'));
regret_AB_var = sqrt(var(regret_AB'));
regret_Shrink_var = sqrt(var(regret_Shrink'));    


subplot(2,2,1)
plot(sqrt(1:(n)), regret_FTL_mean, 'b','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)), regret_FTRL_mean,'r','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)), regret_AB_mean,'k','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)), regret_Shrink_mean,'g','LineWidth',1.5);
hold on;

errorbar(sqrt(1:gap:(n)),regret_FTL_mean(1:gap:(n)), regret_FTL_var(1:gap:(n)), 'bx','LineWidth',1.5);
hold on;
errorbar(sqrt(1:gap:(n)),regret_FTRL_mean(1:gap:(n)), regret_FTRL_var(1:gap:(n)), 'rx','LineWidth',1.5);
hold on;
errorbar(sqrt(1:gap:(n)),regret_AB_mean(1:gap:(n)), regret_AB_var(1:gap:(n)), 'kx','LineWidth',1.5);
hold on;
errorbar(sqrt(1:gap:(n)),regret_Shrink_mean(1:gap:(n)), regret_Shrink_var(1:gap:(n)), 'gx','LineWidth',1.5);

%ylim([0 500])
xlabel('\fontsize{20} sqrt(n)');
title('\fontsize{15} L=0');
ylabel('\fontsize{20} Regret');

if 1==1
subplot(2,2,3)
plot(log(1:(n)),regret_FTL_mean, 'b','LineWidth',1.5);
hold on;
plot(log(1:(n)),regret_FTRL_mean,'r','LineWidth',1.5);
hold on;
plot(log(1:(n)),regret_AB_mean,'k','LineWidth',1.5);
hold on;
plot(log(1:(n)),regret_Shrink_mean,'g','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_FTL_mean(1:gap:(n)), regret_FTL_var(1:gap:(n)), 'bx','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_FTRL_mean(1:gap:(n)), regret_FTRL_var(1:gap:(n)), 'rx','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_AB_mean(1:gap:(n)), regret_AB_var(1:gap:(n)), 'kx','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_Shrink_mean(1:gap:(n)), regret_Shrink_var(1:gap:(n)), 'gx','LineWidth',1.5);

xlabel('\fontsize{20} log (n)');
title('\fontsize{15} L = 0');
ylabel('\fontsize{20} Regret');
end

load('./Stoc_01_normalized_unit.mat');

regret_FTL_mean = mean(regret_FTL,2);
regret_FTRL_mean = mean(regret_FTRL,2);
regret_AB_mean = mean(regret_AB,2);
regret_Shrink_mean = mean(regret_Shrink,2);

regret_FTL_var = sqrt(var(regret_FTL'));
regret_FTRL_var = sqrt(var(regret_FTRL'));
regret_AB_var = sqrt(var(regret_AB'));   
regret_Shrink_var = sqrt(var(regret_Shrink'));    


subplot(2,2,2)
plot(sqrt(1:(n)), regret_FTL_mean, 'b','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)), regret_FTRL_mean,'r','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)), regret_AB_mean,'k','LineWidth',1.5);
hold on;
plot(sqrt(1:(n)), regret_Shrink_mean,'g','LineWidth',1.5);
hold on;

errorbar(sqrt(1:gap:(n)),regret_FTL_mean(1:gap:(n)), regret_FTL_var(1:gap:(n)), 'bx','LineWidth',1.5);
hold on;
errorbar(sqrt(1:gap:(n)),regret_FTRL_mean(1:gap:(n)), regret_FTRL_var(1:gap:(n)), 'rx','LineWidth',1.5);
hold on;
errorbar(sqrt(1:gap:(n)),regret_AB_mean(1:gap:(n)), regret_AB_var(1:gap:(n)), 'kx','LineWidth',1.5);
hold on;
errorbar(sqrt(1:gap:(n)),regret_Shrink_mean(1:gap:(n)), regret_Shrink_var(1:gap:(n)), 'gx','LineWidth',1.5);


%ylim([0 500])
xlabel('\fontsize{20} sqrt(n)');
title('\fontsize{15} L=0.1');
ylabel('\fontsize{20} Regret');

if 1==1

subplot(2,2,4)
plot(log(1:(n)),regret_FTL_mean, 'b','LineWidth',1.5);
hold on;
plot(log(1:(n)),regret_FTRL_mean,'r','LineWidth',1.5);
hold on;
plot(log(1:(n)),regret_AB_mean,'k','LineWidth',1.5);
hold on;
plot(log(1:(n)),regret_Shrink_mean,'g','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_FTL_mean(1:gap:(n)), regret_FTL_var(1:gap:(n)), 'bx','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_FTRL_mean(1:gap:(n)), regret_FTRL_var(1:gap:(n)), 'rx','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_AB_mean(1:gap:(n)), regret_AB_var(1:gap:(n)), 'kx','LineWidth',1.5);
hold on;
errorbar(log(1:gap:(n)),regret_Shrink_mean(1:gap:(n)), regret_Shrink_var(1:gap:(n)), 'gx','LineWidth',1.5);

xlabel('\fontsize{20} log (n)');
title('\fontsize{15} L = 0.1');
ylabel('\fontsize{20} Regret');
end
end
h_legend = legend('\fontsize{20} FTL', '\fontsize{20} FTRL', '\fontsize{20} AB', '\fontsize{20} FTSL'); %);%