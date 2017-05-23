%This function assigns intensity values from the TIFF format to a 3-D array
%for analyzation purposes

function [INT] = int_assign(filename)
info=imfinfo(filename);  %importing info from TIFF file
num_images=numel(info); %number of images in TIFF stack
for k=1:num_images %for each image in stack
    I=imread(filename,k); %reading intensisty info from each image in stack
    [a,b]=size(I); %finding size of each image
    for i=1:a %for each row element of each image
        for j=1:b %for each column element of each row of each image
            INT(i,j,k)=I(i,j); %assigning intensity data into each element (row, column, image)
        end
    end
end