function plot_decbound(X,y,w)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% Plot the data
plotData(X, y);
hold on

% Here is the grid range
u = linspace(30, 100, 50);

for i = 1:length(u)

v(i) = -(w(1,:) + w(2,:) * u(i))/w(3,:);
end

plot(u,v);
hold off
end

