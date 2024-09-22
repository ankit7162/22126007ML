% function [ CON,A,P, R, F1 ] = confusionmatrix(ypred,yactual)
% 
%  a=0;
%  b=0;
%  c=0;
%  d=0;
%  for i=1:1:length(ypred)
% 
% 
% 
%      %%%%%%%%%%%Your code here to compute a b c d
% 
% 
% 
% 
% 
% 
% CON=[a c; d b];%%%confusion matrix
% A=((a+b)/(a+b+c+d))*100 %%%% percentage predicted correctly
% P=a/(a+b); %% precision=true positive/predicted positive
% R=a/(a+d); %% recall=true positive/actual positive
% F1=2*P*R/(P+R);%%% F1 socre
% end
% 
function [CON, A, P, R, F1] = confusionmatrix(ypred, yactual)
    % Ensure ypred and yactual are column vectors
    if isrow(ypred)
        ypred = ypred';
    end
    if isrow(yactual)
        yactual = yactual';
    end

    % Initialize counts
    a = 0; % True Positive (TP)
    b = 0; % False Positive (FP)
    c = 0; % False Negative (FN)
    d = 0; % True Negative (TN)

    % Compute the confusion matrix components
    for i = 1:length(ypred)
        if ypred(i) == 1 && yactual(i) == 1
            a = a + 1; % True Positive
        elseif ypred(i) == 1 && yactual(i) == 0
            b = b + 1; % False Positive
        elseif ypred(i) == 0 && yactual(i) == 1
            c = c + 1; % False Negative
        elseif ypred(i) == 0 && yactual(i) == 0
            d = d + 1; % True Negative
        end
    end

    % Confusion matrix
    CON = [a, c; d, b];

    % Metrics calculations
    total = a + b + c + d;
    if total > 0
        A = ((a + b) / (a + b + c + d)) * 100; % Accuracy percentage
        P = a / (a + b); % Precision
        R = a / (a + d); % Recall
        if P + R > 0
            F1 = 2 * P * R / (P + R); % F1 Score
        else
            F1 = 0; % To avoid division by zero if P + R is 0
        end
    else
        A = 0; % Accuracy percentage
        P = 0; % Precision
        R = 0; % Recall
        F1 = 0; % F1 Score
    end
end