function [c] = convergence(Iold, Inew, threshold)
    [row col]= size(Iold);

    //Assuming there is convergence
    c = %T;
    for i=1:row
        if(c == %F) then
            break;
        end 
        for j=1:col
            //d holds the absolute difference in intensity between the two
            //images a
            d = abs ( double(Iold(i,j)) - double(Inew(i,j)) );
            //If d is greater than the threshold, convergence is not reached
            if(d>threshold) then
                c=%F;
            end
            
            if(c == %F) then
            break;
            end
        end
    end
    
endfunction
