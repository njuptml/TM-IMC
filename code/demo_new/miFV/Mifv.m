function [train_fv] = MyMifv(file,vecfile,sumVec)
% 
%	Usage:
%		[train_fv] = LineVectors(file,word,vecfile,sumVec)
%
%	Input:
%		file:    the features of the sample text, every line is a instance.
%		word:	 marked word to obtain the instance of each sample.
%		vecfile: the vectors of the sample text
%		sumVec:	 the total number of vectors in vecfile.
%		
%	Output:
%		train_fv:  each sample is a vector
%
[rowVec s] = LineVectors(file,vecfile,sumVec);
train_bags=cell(size(s),1);
idx=1;
for i=1:size(s)
    train_bags{i,1}=rowVec(idx:idx+s(i)-1,:);%Create a training package
    idx=idx+s(i);
end
test_bags=[];
[train_fv,test_fv]=mimlfv(train_bags,test_bags);%Loading training data
num_train=size(train_bags,1);
num_test=size(test_bags,1);
test_data=cell(num_test,1);
train_data=cell(num_train,1);
for i=1:num_train
    train_data{i,1}=train_fv(i,:)';
end
for i=1:num_test
    test_data{i,1}=test_fv(i,:)';
end
end