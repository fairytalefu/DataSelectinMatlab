function [Data]=DataProcess(X,Y,Data_length,parts)
%---------获取X矩阵的最大和最小值，然后均分为parts份--------------------------
x_max = max(X);
x_min = min(X);
interval = (x_max-x_min)/parts;
%--------------------------------------------------------------------------
% 找出XX中落在各个区间的点并分别存在cell k中
k = cell(parts,1);
for i=1:parts
   mono_temp=[];
   for j=1:Data_length
    if((X(j)>=x_min+(i-1)*interval) && (X(j)< x_min+i*interval))
       temp=X(j);
       mono_temp=[mono_temp,temp];
    end
   end
    k{i}=mono_temp;
    clear mono_temp;
end
%--------------------------------------------------------------------------
%从cell k中取出数据，然后拼成parts*2的矩阵Data，以便存储到.xlsx文件中---------
x_data=[];
y_data=[];
for i=1:parts
    xc =[k{i}];
    if(~isempty(xc))
        x_data=[x_data,xc(1)];
        index_x_data = find(X==xc(1));
        y_data=[y_data,Y(index_x_data)];
   end
end
Data=[x_data',y_data'];
end
%----------------------------------------------------------------------------