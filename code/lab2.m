clc;

filename = './lab2data1.txt';

Data2 = load(filename);
X = [Data2(:,1) Data2(:,2)];
y = Data2(:,3);

%% 1.1
figure(1)
plotData(X,y);

%% 1.2
% sigmoid function

%% 1.3
w = [0 0 0]';
e = costFunction(X,y,w);
disp(['The cost for intial value of w is ',num2str(e)]);

%% 1.4
t = [0 0 0]';
options = optimoptions('fminunc','GradObj','on','MaxIter',400);
[w, cost] = fminunc(@(t)costFunction(X,y,t),t,options);
disp('The parameters are ');
disp(w)

%% 1.5 
% to plot the decision boundary
plot_decbound(X,y,w);

%% 1.6 
% to test for a student with an
% Exam 1 score of 45 and and Exam 2 score of 85

marks = [45 85];
[y_pred] = predict(marks,w);
disp(['The probability of admission of student is ',num2str(y_pred)]);

%% training accuracy
[y_pred] = predict(X,w);

y_pred = y_pred > 0.5; % to check and assign a class for data

error = 0;
for nsamp = 1:length(y)
    if y(nsamp) ~= y_pred(nsamp)
        error = error + 1;
    end
end
accuracy = (1-error/length(y))*100; % to get accuracy of training data

disp(['The accuracy of traing data is ', num2str(accuracy),' %']);

%% 2.1
filename = './lab2data2.txt';

Data2 = load(filename);
X = [Data2(:,1) Data2(:,2)];
y = Data2(:,3);

%% 2
figure(2)
plotData(X,y);

%% 2.1

% to transofrm features
phi_X = transformFeatures( X );

%% 2.2
% to regularise
lambda = 0.005;
w = zeros(size(phi_X,2),1);
[e grad] = costFunction_regu(phi_X,y,w, lambda);
disp(['The cost for intial value of w is ',num2str(e)]);

%% 2.3
t = zeros(size(phi_X,2),1);
options = optimoptions('fminunc','GradObj','on','MaxIter',400);
[w, cost] = fminunc(@(t)costFunction_regu(phi_X,y,t, lambda),t,options);

figure(2)
plot_decbound_regu(X,y,w);