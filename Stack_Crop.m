clear;
clc;

filename='EOL_T3_Mem_Norm_Cropped.tif'
saveas='EOL_T3_Mem_Norm_Cropped2.tif'
info=imfinfo(filename);  %importing info from TIFF file
num_images=numel(info); %number of images in TIFF stack

I=imread(filename,85); %reading intensisty info from each image in stack
imwrite(I,saveas);
for k=86:217 %for each image in stack
    I=imread(filename,k); %reading intensisty info from each image in stack
    imwrite(I,saveas,'writemode','append'); %
end