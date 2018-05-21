clc;
clear;
load('GPCR-GO-MF.mat');
Q1=[];
Q2=[];
Q3=[];
Q=[];
k=50;
lambda = 0.3;
maxiter = 200;
X=GPCR_fvmf;
Y=GO_fvmf;
n=size(Tr1,2);
 W1 = randn(size(X,2), k);
 H1= randn(size(Y,2), k);
 [W, H] = IMC(Tr1, X, Y, k, lambda, maxiter, W1, H1);
 Q1=X*W'*H*Y';
 W2 = randn(size(X,2), k);
 H2 = randn(size(Y,2), k);
  [W, H] = IMC(Tr2, X, Y, k, lambda, maxiter, W2, H2);
  Q2=X*W'*H*Y';
  W3 = randn(size(X,2), k);
 H3 = randn(size(Y,2), k);
 [W, H] = IMC(Tr3, X, Y, k, lambda, maxiter, W3, H3);
 Q3=X*W'*H*Y';
for i=1:size(Tr1,1)
    for j=1:size(Tr1,2)
        if Tr1(i,j)==1
            Q1(i,j)=0;
        end
    end
end
for i=1:size(Tr2,1)
    for j=1:size(Tr2,2)
        if Tr2(i,j)==1
            Q2(i,j)=0;
        end
    end
end
for i=1:size(Tr3,1)
    for j=1:size(Tr3,2)
        if Tr3(i,j)==1
            Q3(i,j)=0;
        end
    end
end
 Q=Q1+Q2+Q3;
 save predict_scores.txt -ascii Q;