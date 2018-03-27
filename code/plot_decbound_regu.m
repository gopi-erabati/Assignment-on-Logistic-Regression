function plot_decbound_regu(X,y,w)

% Plot the data
plotData(X, y);
hold on
% Here is the grid range
u = linspace(-1, 1.5, 50);
v = linspace(-1, 1.5, 50);
z = zeros(length(u), length(v));
% Evaluate z = theta*x over the grid
for i = 1:length(u)
for j = 1:length(v)
z(i,j) = transformFeatures([u(i), v(j)])*w;
end
end
z = z'; % important to transpose z before calling contour
% you need to specify the range [0, 0]
contour(u, v, z, [0, 0], 'LineWidth', 2)
hold off


end

