function [ y ] = predict( X,w )
% test function to predict whether a candidate can be admitted or not
X = [ones(size(X,1),1) X];
y = sigmoid(w'*X');


end

