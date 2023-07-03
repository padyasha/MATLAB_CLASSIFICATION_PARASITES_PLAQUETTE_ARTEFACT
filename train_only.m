function deepnet=train_only(per)
%per=10;
for i=1:round((9/100)*per)
    path=strcat(pwd,'\artefect\',num2str(i),'.jpg');
    im=imread(path);
    X(:,i)=double(im(:));
    T(:,i)=[1 0 0];
end 
for j=1:round((119/100)*per)
    path=strcat(pwd,'\parasite\',num2str(j),'.jpg');
    im=imread(path);
    X(:,i+j)=double(im(:));
    T(:,i+j)=[0 1 0];
end
for k=1:round((30/100)*per)
    path=strcat(pwd,'\plaquette\',num2str(k),'.jpg');
    im=imread(path);
    X(:,i+j+k)=double(im(:));
    T(:,i+j+k)=[0 0 1];
end

hiddenSize = 100;
autoenc1 = trainAutoencoder(X,hiddenSize,'L2WeightRegularization',0.001,'SparsityRegularization',4,'SparsityProportion',0.05,'DecoderTransferFunction','purelin');
features1 = encode(autoenc1,X);
hiddenSize = 50;
autoenc2 = trainAutoencoder(features1,hiddenSize,'L2WeightRegularization',0.001,'SparsityRegularization',4,'SparsityProportion',0.05,'DecoderTransferFunction','purelin','ScaleData',false);
features2 = encode(autoenc2,features1);
softnet = trainSoftmaxLayer(features2,T,'LossFunction','crossentropy');
deepnet = stack(autoenc1,autoenc2,softnet);
deepnet = train(deepnet,X,T);
