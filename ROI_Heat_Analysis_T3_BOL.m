%Jonathan Braaten
%Carnegie Mellon University
%Completed May 30, 2017
%ROI_Heat_Analysis_T3_BOL.m
%---------------------------
%This script plots the average and log normal distributions of the non-zero
%intensity data for the Type 3 Pt/Vu MEA samples

clear;
clc;

voxel_size = 0.1275; %micron
INT_RANGE = 400; %Magnitude intensity

[T3_BOL_AVG_SLICE,X_T3_BOL,Y_T3_BOL,DIST_T3_BOL]=IntensityAverageSlice('BOL_T3_Mem_Norm_Cropped2.tif',voxel_size,INT_RANGE);

figure(1)
imagesc(X_T3_BOL,Y_T3_BOL,DIST_T3_BOL.')
colormap jet
set(gca,'YDir','normal')
hold on
plot(X_T3_BOL,T3_BOL_AVG_SLICE,'r-','LineWidth',2)
h=colorbar;
legend('Mean')
set(get(h,'title'),'string','PDF')
xlabel('Distance Through MEA [\mum]')
ylabel('Normalized Pixel Intensity [-]')
title('Pt/Vu Fresh MEA Intensity Distribution')
fig=gcf;
set(findall(fig,'-property','FontSize','FontName','FontWeight'),'FontSize',12,'FontName','Cambria','FontWeight','Bold')
