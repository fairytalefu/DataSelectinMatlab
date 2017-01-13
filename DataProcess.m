function [Data]=DataProcess(X,Y,Data_length,parts)
%---------��ȡX�����������Сֵ��Ȼ�����Ϊparts��--------------------------
x_max = max(X);
x_min = min(X);
interval = (x_max-x_min)/parts;
%--------------------------------------------------------------------------
% �ҳ�XX�����ڸ�������ĵ㲢�ֱ����cell k��
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
%��cell k��ȡ�����ݣ�Ȼ��ƴ��parts*2�ľ���Data���Ա�洢��.xlsx�ļ���---------
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