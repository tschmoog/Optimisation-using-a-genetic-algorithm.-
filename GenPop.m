function [ Population ] = GenPop( no_of_points )
%GenPop generates N random starting points in a 2 dimentional space between
%the values of - 10 and 10

%Create array of x and y values to pass onto the algorithm 
Population = (20*rand(no_of_points, 2) - 10);


end

