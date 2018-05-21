function [Z,A]=transdata(targets)
[x,y]=size(targets);
Z=-ones(x);
for i=1:x
    for j=1:x
        if sum(abs(targets(i,:)-targets(j,:)))<2*y/3
            Z(i,j)=1;
        end
    end
end
A=Z;
for i=1:x
    for j=1:x
        if randi(2)==2
            A(i,j)=0;
        end
    end
end