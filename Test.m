%---------------------------------数据采样----------------------------------
clc;
clear;
close all;
%--------------------------------------------------------------------------
parts = 26;
%------------------------读取csv数据----------------------------------------
Data=csvread('standard.csv',1,0,[1,0,26,1]);
X = Data(:,1);
Y = Data(:,2);
plot(X,Y,'r-*');
hold on;
%--------------------------------------------------------------------------
Data_MONO = xlsread('MONO Cell VI.xls',1);
Data_MONO_length = length(Data_MONO(:,2));
X_MONO = Data_MONO(:,2);
Y_MONO = Data_MONO(:,3);
plot(X_MONO,Y_MONO,'*');
hold on;
DD = DataProcess(X_MONO,Y_MONO,Data_MONO_length,parts);
xlswrite('E:\研究生\课题\SVM\20170112\Result.xlsx',DD,1);
%--------------------------------------------------------------------------
Data_PERC_Cell= xlsread('PERC Cell VI.xls',1);
Data_PERC_Cell_length = length(Data_PERC_Cell(:,2));
X_PERC_Cell = Data_PERC_Cell(:,1);
Y_PERC_Cell = Data_PERC_Cell(:,2);
plot(X_PERC_Cell,Y_PERC_Cell,'g--o');
hold on;
DD2 = DataProcess(X_PERC_Cell,Y_PERC_Cell,Data_PERC_Cell_length,parts);
xlswrite('E:\研究生\课题\SVM\20170112\Result.xlsx',DD2,2);