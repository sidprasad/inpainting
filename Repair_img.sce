//Inpainting Program

exec('C:\Users\Siddhartha\Documents\Summer 2013\Scilab stuff\v5\inpaint.sci', -1);
exec('C:\Users\Siddhartha\Documents\Summer 2013\Scilab stuff\v5\repair4.sci', -1);
exec('C:\Users\Siddhartha\Documents\Summer 2013\Scilab stuff\v5\convergence.sci', -1);

name = input("You must have Scilab Image and Video Processing Toolbox enabled.Enter the image.");
mask = input("Enter the mask");
nme = input("Enter name of output file");

name = imread(name);
mask = imread(mask);

inpaint (name, mask, nme);
