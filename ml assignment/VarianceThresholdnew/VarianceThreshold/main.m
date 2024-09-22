clc;
clear;

% Load the data
data = readmatrix('encoded.csv');

% Extract features and labels
X = data(:, 3:end-1); 
y = data(:, end);      

% Set variance threshold
threshold = 0.5;

% Compute variance for each feature and select features above threshold
featureVariance = var(X);
selectedFeatureIndices = find(featureVariance > threshold);

% Filter the features and normalize
X_filtered = X(:, selectedFeatureIndices);
X_filtered = featureNormalize(X_filtered); % Use featureNormalize for standardization

% Display initial and filtered feature counts
fprintf("Initial Number of Features\n");
fprintf('%d\n', width(X));
fprintf("Number of features after variance thresholding:\n");
fprintf('%d\n', width(X_filtered));

% Update X to use filtered features
X = X_filtered;

% Split the data into training (80%) and testing (20%)
trainSize = floor(0.8 * size(data, 1)); 
Xtrain = X(1:trainSize, :);
ytrain = y(1:trainSize);
Xtest = X((trainSize + 1):end, :);
ytest = y((trainSize + 1):end);

% Ensure labels are binary integers (0 or 1)
ytrain = round(ytrain); % Rounds to 0 or 1 if labels are continuous
ytest = round(ytest);

% Convert labels to categorical for KNN to recognize classes properly
ytrain = categorical(ytrain);
ytest = categorical(ytest);

% Ensure no NaN values in the labels
if any(isnan(ytrain))
    error('ytrain contains NaN values. Clean the data.');
end
if any(isnan(ytest))
    error('ytest contains NaN values. Clean the data.');
end

% Apply PCA to reduce feature dimensions before training models
[coeff, XtrainPCA, ~, ~, explained] = pca(Xtrain);

% Select enough principal components to explain 95% of the variance
numComponents = find(cumsum(explained) >= 95, 1);
XtrainPCA = XtrainPCA(:, 1:numComponents);
XtestPCA = (Xtest - mean(Xtest)) * coeff(:, 1:numComponents); % Apply PCA transformation to test set

fprintf('Number of Principal Components used: %d\n', numComponents);

% K-Nearest Neighbors (KNN)
try
    knnModel = fitcknn(XtrainPCA, ytrain, 'NumNeighbors', 5);
    knnPredictions = predict(knnModel, XtestPCA);
    
    % Calculate accuracy for KNN
    knnAccuracy = sum(knnPredictions == ytest) / length(ytest);
    disp(['KNN Accuracy: ', num2str(knnAccuracy * 100), '%']);
catch ME
    disp('Error in KNN Model:');
    disp(ME.message);
end

% Logistic Regression
options = statset('MaxIter', 1000); % Set maximum iterations
try
    logisticModel = fitglm(XtrainPCA, ytrain, 'Distribution', 'binomial', 'Options', options);
    logisticPredictions = round(predict(logisticModel, XtestPCA)); % Ensure binary predictions
    
    % Calculate accuracy for Logistic Regression
    logisticAccuracy = sum(logisticPredictions == ytest) / length(ytest);
    disp(['Logistic Regression Accuracy: ', num2str(logisticAccuracy * 100), '%']);
catch ME
    disp('Error in Logistic Regression Model:');
    disp(ME.message);
end

% Calculate Confusion Matrices for both models
try
    % Confusion matrix for KNN
    [confusionMatrixKNN, accuracyKNN, precisionKNN, recallKNN, f1ScoreKNN] = confusionmat(knnPredictions, ytest);
    disp('Confusion Matrix for KNN:');
    disp(confusionMatrixKNN);

    % Display KNN Metrics
    disp('KNN Metrics:');
    disp(['Accuracy: ', num2str(accuracyKNN), '%']);
    disp(['Precision: ', num2str(precisionKNN), '%']);
    disp(['Recall: ', num2str(recallKNN), '%']);
    disp(['F1 Score: ', num2str(f1ScoreKNN)]);
catch ME
    disp('Error in Confusion Matrix for KNN:');
    disp(ME.message);
end

try
    % Confusion matrix for Logistic Regression
    [confusionMatrixLogistic, accuracyLogistic, precisionLogistic, recallLogistic, f1ScoreLogistic] = confusionmat(logisticPredictions, ytest);
    disp('Confusion Matrix for Logistic Regression:');
    disp(confusionMatrixLogistic);

    % Display Logistic Regression Metrics
    disp('Logistic Regression Metrics:');
    disp(['Accuracy: ', num2str(accuracyLogistic), '%']);
    disp(['Precision: ', num2str(precisionLogistic), '%']);
    disp(['Recall: ', num2str(recallLogistic), '%']);
    disp(['F1 Score: ', num2str(f1ScoreLogistic)]);
catch ME
    disp('Error in Confusion Matrix for Logistic Regression:');
    disp(ME.message);
end




