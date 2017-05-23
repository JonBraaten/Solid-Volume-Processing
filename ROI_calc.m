%This function "ROI_calc" takes in a 3-d matrix with intensity values, and
%performs region of interest (ROI) calculations on the n x n (voxel size)
%sections of the matrix

%it outputs the average of each n x n slice, as well as the x-location of
%each slice

function [X,ROI_avg] = ROI_calc(INT,n,voxel_size)
p=1;
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
