function[Tr1,Tr2,Tr3,Te1,Te2,Te3] = Split(B)
[r,c]=size(B);
totalNum=r*c;
Tr1=B;
randomindex=1+floor(rand(1,floor(totalNum*2/5))*totalNum);
Tr1(randomindex)=0;
Te1=B-Tr1;
Tr2=Tr1;
randomindex=1;
randomindex=1+floor(rand(1,(totalNum*7/10))*totalNum);
Tr2(randomindex)=0;
Te2=Tr1-Tr2;
Te3=B-Te1-Te2;
Tr3=B-Te3;
end