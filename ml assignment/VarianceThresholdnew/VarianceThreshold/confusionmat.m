% Confusion Matrix and Metrics Calculation Function
function [CON, A, P, R, F1] = confusionmat(ypred, yactual)
    a = 0; % True Positives
    b = 0; % False Positives
    c = 0; % False Negatives
    d = 0; % True Negatives

    % Calculate TP, FP, FN, TN
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

    % Construct Confusion Matrix
    CON = [a, b; c, d];

    % Calculate Metrics
    total = a + b + c + d;
    A = (a + d) / total * 100; % Accuracy
    P = a / (a + b); % Precision
    R = a / (a + c); % Recall
    F1 = 2 * P * R / (P + R); % F1 Score
end