function plotData(X,y)

x1 = X(:,1);
x2 = X(:,2);

x_new1 = [];
x_new0 = [];
y_new1 = [];
y_new0 = [];

for i = 1:length(y)
    if y(i) == 1
        x_new1 = [x_new1 x1(i,:)];
        y_new1 = [y_new1 x2(i,:)];
    else
        x_new0 = [x_new0 x1(i,:)];
        y_new0 = [y_new0 x2(i,:)];
    end
end

scatter(x_new1,y_new1,'+');
xlabel('Exam 1 score');
ylabel('Exam 2 score');
hold on;
scatter(x_new0,y_new0,'o');
