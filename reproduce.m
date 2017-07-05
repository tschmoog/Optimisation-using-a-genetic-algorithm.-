function [ population ] = reproduce( matingPool, populationSize , mpcount, mutationRate)
%Takes two random parents in the matingpool and uses them to generate a
%child. Mutation of the child is also included in this function.

%Preallocate memory 
children = zeros(populationSize,2);
for i = 1:populationSize;
    %Generate a random integer to select a random parent from the mating pool 
    p = round(rand(1)*mpcount); %parent 1
    p2 = round(rand(1)*mpcount); %parent 2
    
    %Take the x coordinate from one parent and the y coordiante from
    %another to form a child
    children(i,1) = matingPool(p,1); 
    children(i,2) = matingPool(p2,2);
    
    
    %Mutation below:
    rando = rand(1); %Random number
    if rando <= mutationRate %If random number less then specified mutation rate:
        coinToss = rand(1); %new random number
        if coinToss <= 0.66 % 66% chance of only one feature being changed in the child
            
            randomnumber = rand(1);
            if randomnumber >=0.5 %50/50 chance of x or y val being mutated
            
                children(i,1) = (20*rand(1) - 10);
            else 
                children(i,2) = (20*rand(1) - 10);
            end
        
        else 
            children(i,1) = (20*rand(1) - 10); %Extension for a completely random child
            children(i,2) = (20*rand(1) - 10); %34% chance of child being completely random.
        end
     
    end
     
end 
children; %remove semi colon to view children ouput
population = children;
end

