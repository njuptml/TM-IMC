function [train_fv,test_fv] = mimlfv(train_bags,test_bags)
opt = InitSystem();
opt.kmeans_num_center = 1;
opt.PCA_energy = 0.0;

num_train_bag=size(train_bags,1);
num_test_bag=size(test_bags,1);
num_bag=num_train_bag+num_test_bag;
data=[train_bags;test_bags];
data=cell(num_bag,1);
for j=1:num_bag
     if j<=num_train_bag
        data{j,1}=train_bags{j,1};
     else
         data{j,1}=test_bags{j-num_train_bag,1};
     end
 end



train_instances=[];
for ii=1:num_train_bag
    train_instances=[train_instances;train_bags{ii,1}];
end
[codes,opt]=CreateKmeansCodebook(train_instances,opt);

dim=opt.PCA_dim*opt.kmeans_num_center*2;
fv=zeros(num_bag,dim);

for ii=1:num_bag
    fv(ii,:)=ExtractFV(data{ii,1},opt,codes);
    fv(ii,:)=fv(ii,:)/norm(fv(ii,:));
end

minv=min(fv);
maxv=max(fv)-minv;
maxv=1./maxv;
fv=(fv-repmat(minv,num_bag,1)).*repmat(maxv,num_bag,1);
fv(isnan(fv))=0;

train_fv=fv(1:num_train_bag,:);
test_fv=fv(num_train_bag+1:end,:);

end

