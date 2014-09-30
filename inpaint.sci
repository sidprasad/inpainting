//Siddhartha Prasad
//Siddhartha.Prasad@tufts.edu
function [I] = inpaint(im,mask, name)
    
    //These are constants you can fiddle with
    alpha=1;
    tmax =10000;
    nTsteps=70000;
    
    disp(nTsteps)
    
    I = im;
    
    [r c] = size(im);
    
    for i=1:r
        for j = 1:c
            if(mask(i,j)==0) then
                I(i,j) =0;
            end
        end
    end
    
    imshow(I);
    
    
    I = repair4(tmax,nTsteps ,alpha,I, mask);

    name = name + '.png';
    imwrite(I, name);
endfunction
