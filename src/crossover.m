function child = crossover (parent_1 , parent_2)
    child = zeros(1,3);
    %to get randomly part from parent 1 to be transmitted to the child
    rand_part= randi(3);
    child(1,1) = parent_1(rand_part);
    
    if (rand_part == 1)
        child (1,2) = parent_2(2);
        child (1,3) = parent_2(3);
    elseif (rand_part == 2)
        child (1,1) = parent_2(1);
        child (1,3) = parent_2(3) ;      
    else 
        child (1,1) = parent_2(1);
        child (1,2) = parent_2(2);
    end

end