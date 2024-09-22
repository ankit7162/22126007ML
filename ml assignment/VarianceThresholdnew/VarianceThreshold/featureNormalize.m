% Feature Normalization Function (Use only this one function)
function X_norm = featureNormalize(X)
    mu = mean(X); 
    sigma = std(X); 
    X_norm = (X - mu) ./ sigma;
end