%This program computes ROI averages for Nano-CT intensity data

clear;
clc;

filename='EOL_T8_Mem_Norm_Cropped.tif'
voxel_size = 0.1275;
info=imfinfo(filename);  %importing info from TIFF file
%num_images=numel(info); %number of images in TIFF stack
num_images=225;
for k=1:num_images %for each image in stack
    I=imread(filename,k); %reading intensisty info from each image in stack
    [a,b]=size(I); %finding size of each image
    for i=1:a %for each row element of each image
        for j=1:b %for each column element of each row of each image
            INT(i,j,k)=I(i,j); %assigning intensity data into each element (row, column, image)
        end
    end
end


p=1;
n=200; %ROI size (nxn)
%Running ROI statistics on Intensity data
[a,b,c]=size(INT);
for k=n+1:n:c
    for i=n+1:n:a
        for j=1:b
            B=squeeze(INT(i-n:i-1,j,k-n:k-1));
            ROI_avg(p,j)=mean2(B(B~=0));
            X(p,j)=j*voxel_size;
        end
    end
    p=p+1;
end

trans_x=X.';
trans_ROI=ROI_avg.';

plot(trans_x,trans_ROI)
str2={'MEA Thickness [\mum]'};
str1={'Averaged Pixel Intensity','Normalized (Membrane=100, Air=0)'};
ylabel(str1)
xlabel(str2)
title('32x32 Voxel Average ROI')
set(gca,'LineWidth',2,'FontSize',12,'FontWeight','bold');
grid on
axis([0 35 0 500])

%log normal distribution
figure(2)
hold on
[L1,L2]=size(trans_ROI);
for p=1:L2
    fit_param=lognfit(trans_ROI(:,p))
    mu=fit_param(1);
    sig=fit_param(2);
    x(:,p)=(0:1:2000);
    y(:,p)=lognpdf(x(:,p),mu,sig);
    histfit(trans_ROI(:,p),100,'lognormal')
end



% histogram(trans_ROI)

