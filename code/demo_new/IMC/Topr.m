function p = Topr(r,Tr1,Tr2,Tr3,Te1,Te2,Te3,M1,M2,M3,B)

%	Input:
%     r:   the rank of the GPCR gp in the list associated with GO go
%     Tr1,Tr2,Tr3:  training set. m x n. 
%     Te1,Te2,Te3:  test set. m x n.
%	  M1,M2,M3:   Complete matrix (ratings/associations). m x n.
%     B: associations matrix (ratings/associations). m x n.

%	Output:
%    Te1,Te2,Te3:  associations matrix(B) is divided into three parts as test sets. m x n.
%                  and B=Te1+Te2+Te3.
%    Tr1,Tr2,Tr3:  the corresponding training set. m x n. and B=Tr1+Te1.
%
for i=1:size(Tr1,1)
    for j=1:size(Tr1,2)
        if Tr1(i,j)==1
            M1(i,j)=0;
        end
    end
end
for i=1:size(Tr2,1)
    for j=1:size(Tr2,2)
        if Tr2(i,j)==1
            M2(i,j)=0;
        end
    end
end
for i=1:size(Tr3,1)
    for j=1:size(Tr3,2)
        if Tr3(i,j)==1
            M3(i,j)=0;
        end
    end
end
count1=0;
B1=[];
R1=[];
for i=1:size(M1,2)
    [c1 d1]=sort(abs(M1(:,i)),'descend');
    B1=[B1,c1];
    R1=[R1,d1];
end
Q1=R1(1:r,:);
    for jj=1:size(Q1,2)  
        for ii=1:size(Q1,1)
        if Te1(Q1(ii,jj),jj)==1
            count1=count1+1;
        end
    end
    end  
count2=0;
B2=[];
R2=[];
for i=1:size(M2,2) 
    [c2 d2]=sort(abs(M2(:,i)),'descend');
    B2=[B2,c2];
    R2=[R2,d2];
end
Q2=R2(1:r,:);  
    for jj=1:size(Q2,2)  
        for ii=1:size(Q2,1)
        if Te2(Q2(ii,jj),jj)==1
            count2=count2+1;
        end
    end
    end
    
count3=0;
B3=[];
R3=[];
for i=1:size(M3,2)   
    [c3 d3]=sort(abs(M3(:,i)),'descend');
    B3=[B3,c3];
    R3=[R3,d3];
end
Q3=R3(1:r,:); 
    for jj=1:size(Q3,2)
        for ii=1:size(Q3,1)
        if Te3(Q3(ii,jj),jj)==1
            count3=count3+1;
        end
    end
    end
p=(count1+count2+count3)/sum(sum(B));
end