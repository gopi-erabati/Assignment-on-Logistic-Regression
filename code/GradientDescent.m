function [w] = GradientDescent(X,y,w,alpha,NIter)
% this function computes the parameters given the input , output
% varaibles , intital parameters and iterations using gradient descent.

J = [];

for i = 1:NIter
    w = w - alpha * diffCost(X,y,w); % the gradient descent iteration logic
    J = [J costFun(X,y,w)];
end

% to plot cost function vs iterations
x = 1:NIter;
figure(2)
plot(x,J);
xlabel('no. of iterations');
ylabel('cost function');
