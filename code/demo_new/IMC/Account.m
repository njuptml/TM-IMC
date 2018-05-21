function [s] = Account(file)
%Input:
%    file:    the features of the sample text, every line is a instance.
%	Output:
%       s:    a number of instance in each sample 
fid=fopen(file,'r');%Get the number of rows per GPCR
l=[];
s=[];
lines = 0;
while 1
    tline=fgetl(fid);
    if ~ischar(tline)
        break;
    end
  while tline(1)~='*'
    lines = lines + 1;
    tline=fgetl(fid);
     if ~ischar(tline)
        break;
     end
  end 
     tline(1)~='*' 
       l=[l;lines];
         lines=0;
    s=l+1;
    s(1,:)=[];
end
end