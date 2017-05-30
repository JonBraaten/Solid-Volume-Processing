%Jonathan Braaten
%Carnegie Mellon University
%Completed May 30, 2017
%IntensityAverageSlice.m
%---------------------------
%IntensityAverageSlice takes the average intensity of each vertical column or "slice"
%from a 3D tiff stack. Takes a filename string input, voxel size, and Intensity Range, and
%outputs the average intensity per slice array ("INT_AVG") and a distance through the
%volume ("X") as well as the lognormal distribution specified by "DIST" and
%the intensity range specified by "Y" for plotting.
function [ INT_AVG,X,Y,DIST ] = IntensityAverageSlice( filename,voxel_size,INT_RANGE ) %setting inputs/outputs
[INT] = int_assign(filename); %calling int_assign function to write intensity data to a 3-D matrix
[a,b,c]=size(INT); %calculating the size of the 3-D matrix
for j=1:b %iterating for each slice of the 3-D matrix (thickness of MEA direction)
    INT_AVG(j)=mean(nonzeros(INT(:,j,:))); %averaging non-zero terms of column slice
    [Y,D]=lognorm_dist(nonzeros(squeeze(double(INT(:,j,:)))),INT_RANGE); %log-normal fitting of data in each slice
    for i=1:length(Y) %iterating through log normal distribution data
        DIST(j,i)=D(i); %assigning log normal data points to array slots in INT_RANGE
    end
end
X=[0:voxel_size:(b-1)*voxel_size]; %distance array - number of voxels times voxel size
%end function
end

