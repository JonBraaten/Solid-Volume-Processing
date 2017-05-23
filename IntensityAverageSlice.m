function [ INT_AVG,DIST,X ] = IntensityAverageSlice( filename,voxel_size )
%IntensityAverageSlice takes the average intensity of each vertical column or "slice"
%from a 3D tiff stack. Takes a filename string input, and voxel size, and
%outputs the average intensity per slice array and a distance array
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

for j=1:b %for each column slice in INT
    ROW_I=INT(:,j,:); %making 1-D array out of the 2-D matrix INT for each column slice in INT
    INT_AVG(j)=mean(nonzeros(ROW_I)); %averaging non-zero terms of column slice
    DIST(:,j)
end
X=[0:voxel_size:(length(INT_AVG)-1)*voxel_size]; %distance array - number of voxels times voxel size
%end function
end

