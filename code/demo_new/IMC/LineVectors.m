function [rowVec s] = LineVectors(file,vecfile,sumVec)
% 
%	Usage:
%		[rowVec s] = LineVectors(file,vecfile,sumVec)
%
%	Input:
%		file:    the features of the sample text, every line is a instance.
%		word:	 marked word to obtain the instance of each sample.
%		vecfile: the vectors of the sample text
%		sumVec:	 the total number of vectors in vecfile.
%		
%	Output:
%		rowVec:   each row with a vector,this is row vector
%       s:    a number of instance in each sample 
%
fid=fopen(file,'r');%Get the number of rows per GPCR
x=[];
temp=0;
while 1
    tline=fgetl(fid);
    if ~ischar(tline)
        break;
    end
    number=regexp(tline,' ','split');
    temp=temp+size(number,2);
    x=[x;temp];
end
f=fopen(vecfile,'r');%Vector file
s = Account(file);
N=(fscanf(f,'%g',[100 sumVec]))';
rowVec=[];
    for j=1:sum(s)
        if j==1
           temp=mean(N(1:3,:));
        else
            a=x(j-1,:)+1;
            b=x(j,:);
            temp=mean(N(a:b,:));
        end
        rowVec(j,:)=temp;
    end
end

