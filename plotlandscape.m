function plotlandscape(upper,lower,N, population)

%This function was modified to also take a 'population' variable which is
%the population of points to be used in the genetic algorithm. This allows
%each point to be plotted on the generated figures. 

%--------------------------------------------------------------------------
%This is the plotting function of the Gaussian landscape generator(2D only)
%
%Syntax: plotlandscape(upper,lower,N)
%
%Example:plotlandscape(5,-5,100)
%
%Inputs:
%       upper boundary of the search space
%       lower boundary of the search space
%       number of sampling points
%
%Outputs:
%       3D surface plot
%       2D contour plot
%
%Author: Bo Yuan (boyuan@itee.uq.edu.au)
%--------------------------------------------------------------------------

%if nargin~=3
    
%    disp('Usage: plotlandscape(upper,lower,N)');
%    return;
    
%end

if upper<=lower
    
    disp('Upper must be larger than Lower!');
    return;
    
end

if N<10
    
    disp('Incorrect N value!');
    return;
    
end

%-----------------------------------------------------

inc=(upper-lower)/N;

x=lower:inc:upper;     %x coordinates
y=lower:inc:upper;     %y coordinates

d=length(y);

pos=zeros(d*d,2);      %(x,y)coordinates for all sampling points

pops = population; %(x,y) co ordinates of population 

for i=1:d
    
    pos((i-1)*d+1:i*d,1)=x(i)*ones(d,1);
    
end



pos(:,2)=repmat(y',d,1);

f=fitness(pos);        %evaluate individuals
f2 = fitness(pops);    %evaluate population fitness
z=vec2mat(f,d)';       %transform into a matrix

figure;
  
colormap(gray);        %3D surface plot
surfl(x,y,z);
title('Figure X.0'), xlabel('X'), ylabel('Y'), zlabel('Height')
shading interp;
hold on 
for i = 1:size(pops,1)
    plot3(pops(i,1),pops(i,2), f2(1,i),'r*','MarkerSize',10);
end





figure;

[C,H]=contour(x,y,z);  %2D contour plot
title('Figure X.1'), xlabel('X'), ylabel('Y')
hold on
for i = 1:size(pops,1)
    plot(pops(i,1),pops(i,2),'r*','MarkerSize',10);
end
hold off