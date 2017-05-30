%Jonathan Braaten
%Carnegie Mellon University
%Completed May 30, 2017
%Visualize_Stack.m
%---------------------------
%This script opens and scrolls through a single .tif stack using MATLAB's image viewer to allow for
%visualization of each image in the .tif stack.
clear;
clc;
filename1='EOL_T8_Mem_Norm_Cropped2.tif'; %reading file
info=imfinfo(filename1); %getting stack information
num=numel(info); %finding numer of images in stack
for i=1:num %iterating through each image in stack
    I=imread(filename1,i); %reading each image in stack
    figure(1) %opening new figure
    imshow(imadjust(I)); %showing each image in stack
    pause(); %pausing to allow for manual scrolling through stack
    i %displaying image number in command window
end
