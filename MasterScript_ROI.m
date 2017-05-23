%Master Script

clear;
clc;

voxel_size = 0.1275;

[T3_BOL_AVG_SLICE,X_T3_BOL]=IntensityAverageSlice('BOL_T3_Mem_Norm_Cropped2.tif',voxel_size);
[T3_EOL_AVG_SLICE,X_T3_EOL]=IntensityAverageSlice('EOL_T3_Mem_Norm_Cropped2.tif',voxel_size);
[T8_BOL_AVG_SLICE,X_T8_BOL]=IntensityAverageSlice('BOL_T8_Mem_Norm_Cropped.tif',voxel_size);
[T8_EOL_AVG_SLICE,X_T8_EOL]=IntensityAverageSlice('EOL_T8_Mem_Norm_Cropped2.tif',voxel_size);
plot(1+0.5+X_T3_BOL,T3_BOL_AVG_SLICE,'r--','LineWidth',3)
hold on
plot(1+X_T3_EOL,T3_EOL_AVG_SLICE,'r-','LineWidth',3)
plot(X_T8_BOL,T8_BOL_AVG_SLICE,'b--','LineWidth',3)
plot(0.75+X_T8_EOL,T8_EOL_AVG_SLICE,'b-','LineWidth',3)
axis([0 40 0 250])
legend('Pt/Vu Fresh','Pt/Vu 30k Cycles','PtCo/HSC Fresh','PtCo/HSC 30k Cycles')
str2={'MEA Thickness [\mum]','Aligned at Anode/Membrane Interface'};
str1={'Averaged Pixel Intensity','Normalized (Membrane=100, Air=0)'};
ylabel(str1)
xlabel(str2)
grid on
title('Pt/Vu & PtCo/HSC MEA Pixel Intensity')
set(gca,'FontSize',24)

figure(2)
plot(0.5+X_T3_BOL,T3_BOL_AVG_SLICE,'r--','LineWidth',3)
hold on
plot(X_T3_EOL,T3_EOL_AVG_SLICE,'r-','LineWidth',3)
legend('Pt/Vu Fresh','Pt/Vu 30k Cycles')
ylabel(str1)
xlabel(str2)
title('Pt/Vu MEA Pixel Intensity')
axis([0 36.1 0 250])
grid on
set(gca,'FontSize',24)

figure(3)
plot(X_T8_BOL,T8_BOL_AVG_SLICE,'b--','LineWidth',3)
hold on
plot(0.75+X_T8_EOL,T8_EOL_AVG_SLICE,'b-','LineWidth',3)
legend('PtCo/HSC Fresh','PtCo/HSC 30k Cycles')
ylabel(str1)
xlabel(str2)
title('PtCo/HSC MEA Pixel Intensity')
grid on
axis([0 34.15 0 250])
set(gca,'FontSize',24)