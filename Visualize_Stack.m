
clear;
clc;
filename1='EOL_T8_Mem_Norm_Cropped.tif'
filename2='EOL_T8_Mem_Norm_Cropped2.tif'
info=imfinfo(filename1);
info2=imfinfo(filename2);
num=numel(info);
for i=1:num
    I=imread(filename1,i);
    I2=imread(filename2,i);
    figure(1)
    imshow(imadjust(I));
    figure(2)
    imshow(imadjust(I2));
    pause()
    i
end
