function x_out= MSB(Aop,y_vec,s_x,lambda1,rnk,iter)
 
% function [x_out obj_func]= MSB(Aop,y_vec,[m n],lambda1,rnk)
 
% This code solves the problem of recovering a low rank matrix from its
% lower dimensional projections 
 
% Minimize ||X||* (nuclear norm of Z)
% Subject to A(X) = Y
 
%formulated as an unconstarined nuclear norm minmization problem using Split bregman algorithm
 
% Minmimize (lambda1)||W||* + 1/2 || A(X) - y ||_2^2 + eta/2 || W-X-B1 ||_2^2
%W is auxillary variable and B1 is the bregman variable
 
%INPUTS
%Aop : Linear operator
%y_vec : Vector of observed values
%s_x : size of the data matrix to be recovered (in form of [m n])
%lambda1:regularization parameter
%rnk   : rank estimation for X
%iter : maximum number of iterations to be carried out
 
%OUTPUTS
%x_out : recovered matrix
 
 
if nargin < 6 
    error('Insufficient Number of arguments');
end
 
%Variable and parameter initialization
eta1=.001; % Regularization parameter
s_new=s_x(1)*s_x(2); 
W=zeros(s_new,1); % proxy variable
B1=ones(s_new,1); % bregman variable
 
% create operator for least square mimimization
I=opDiag(s_new,1);
Aop_concat = opStack([1 eta1],Aop,I);
 
%run iterative algorithm
 for iteration=1:iter
     
     %measurement vector for L2 minimization
     b_vec=[y_vec;eta1*(W-B1)];
   
     %L2 minimization step (subproblem 1)
     X=lsqr(@lsqrAop,b_vec);
    
     %Nuclear norm minization Step (subproblem 2)
     W=X+B1;
    [W, s_thld]=nuc_norm(W,s_x,s_new,lambda1,eta1,rnk);
     
    %bregman variable update
     B1 = B1+X-W;
     
    %Objective function value
    obj_func(iteration)=0.5*norm(y_vec-Aop(X,1))+ lambda1*sum(s_thld) ;
   
    if iteration>10 && abs(obj_func(iteration)-obj_func(iteration-10))<1e-7
        break
    end
 end
 
 %reshaping recovered vector to matrix form
 x_out = reshape(X,s_x(1),s_x(2));
 
 %Plot objective function 
 plot(obj_func);
 title('Convergence of Objective Function')
 xlabel('Number of iterations');
 ylabel('Objective function value');
 
 function y = lsqrAop(x,transpose)
        switch transpose
            case 'transp'
                y = Aop_concat(x,2);
            case 'notransp'
                y = Aop_concat(x,1);
        end
    end
end