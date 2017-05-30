%Jonathan Braaten
%Carnegie Mellon University
%Completed May 30, 2017
%int_assign.m
%---------------------------
%This function assigns intensity values from the TIFF format to a 3-D array
%for analyzation purposes

function [INT] = int_assign(filename)
info=imfinfo(filename);  %importing info from TIFF file
num_images=numel(info); %number of images in TIFF stack
for k=1:num_images %for each image in stack
    I=imread(filename,k); %reading intensisty info from each image in stack
    [a,b]=size(I); %finding size of each image
    b_start=12; %specifying image to begin analysis with
    b_end=276; %specifying image to end analysis with
    for i=1:a %for each row element of each image
        p=1; %implementing counter to start INT matrix with
        for j=b_start:b_end %for each column element of each row of each image
            INT(i,p,k)=I(i,j); %assigning intensity data from "I" into each "INT" element (row, column, image)
            p=p+1; %advancing counter
        end
    end
end
end
