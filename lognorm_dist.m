%Jonathan Braaten
%Carnegie Mellon University
%Completed May 30, 2017
%lognorm_dist.m
%---------------------------
%This function takes in an intensity data matrix and a range to apply the log-normal fit to, and performs a log-normal
%fitting operation on the data within the matrix. The log-normal fit has a
%1-alpha confidence interval (CI). The function then outputs the y-axis for plotting, the
%log-normal PDF distribution for the "INT_RANGE" specified, and the max and min
%values of the mode of the log-normal distribution for each matrix.
function [y,DIST] = lognorm_dist(I,INT_RANGE) %inputs/outputs
y=0:INT_RANGE/1000:INT_RANGE; %setting data points for plotting
alpha=0.05; %95% CI
[A,B]=lognfit(I,alpha); %fitting the data set and returning the mean and standard deviation, respectively
mu=A(1); %finding mean
sig=A(2); %finding standard deviation
mu_low=B(1,1); %finding lower CI on mean
mu_high=B(2,1); %finding lower CI on mean
DIST=lognpdf(y,mu,sig); %creating log-normal PDF data set from range, mean, and standard deviation
end
