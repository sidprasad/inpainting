//Can only take a rectangular omega
function [patch] = repair4(tmax,nTsteps ,alpha, patch, mask )
    //nTsteps is the num of time steps, tmax is the max amount of time
    
    //Threshold for convergence comparisons
    thresh = 1*10^-6;
    
    [H W] = size(mask);
    dy =H/(H-1);
    dx = W/(W-1);
    dt = tmax/(nTsteps-1);
    
    disp(dy)
    disp(dx)
    disp(dt)
    
    
    
    time = 0;
    
   
   for nt=1:nTsteps
       
       disp('Time step:')
       disp(nt)
       
       improvement = 0;
       
       if(modulo(nt,20)==0) then
           olderpatch=patch;
           imshow(patch)
       end
       
       
       oldpatch = patch;
       
       time = time + dt;
       
       //Here apply formula to each pixel in the mask
       
       for i=2:H-1
           for j=2:W-1
            
            if mask(i,j) == 0 then    
                
                
                improvement = ( alpha*dt* double( (oldpatch(i+1,j) +oldpatch(i-1,j) - 2*oldpatch(i,j))/(dy^2) + (oldpatch(i,j+1) + oldpatch(i,j-1) - 2*oldpatch(i,j))/(dx^2) ) );

               
               patch(i,j) = abs( (oldpatch(i,j)) + improvement );  
           end  
               
               
           end
       end
       //
       //
       if(time>=tmax) then 
           break
       end
       
       
       //For every twentieth timestep,
       if(modulo(nt,20)==0) then
           if(convergence(olderpatch,patch,thresh)) then
               pause
               break
               
           end
       end
       
 
   end//Ends outer most loop
   
    
endfunction
