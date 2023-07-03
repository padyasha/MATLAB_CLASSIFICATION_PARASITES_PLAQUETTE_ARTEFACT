function accuracy=test_only(per,deepnet)
ii=0;
for i=9:-1:round((9/100)*per)
    ii=ii+1;
    path=strcat(pwd,'\artefect\',num2str(i),'.jpg');
    im=imread(path);
    X(:,ii)=double(im(:));
    T(:,ii)=[1 0 0];
    class{ii}='artefect';
end 
jj=0;
for j=119:-1:round((119/100)*per)
    jj=jj+1;
    path=strcat(pwd,'\parasite\',num2str(j),'.jpg');
    im=imread(path);
    X(:,ii+jj)=double(im(:));
    T(:,ii+jj)=[0 1 0];
    class{ii+jj}='parasite';
end
kk=0;
for j=30:-1:round((30/100)*per)
    kk=kk+1;
    path=strcat(pwd,'\plaquette\',num2str(j),'.jpg');
    im=imread(path);
    X(:,ii+jj+kk)=double(im(:));
    T(:,ii+jj+kk)=[0 0 1];
    class{ii+jj+kk}='plaquette';
end


im_type = deepnet(X);
figure,plotconfusion(T,im_type);
figure,plotroc(T,im_type);
for i=1:size(im_type,2)
    if(round(im_type(1,i))==1 && round(im_type(2,i))==0 && round(im_type(3,i))==0)
        detected{i}='artefect';
    elseif(round(im_type(1,i))==0 && round(im_type(2,i))==1 && round(im_type(3,i))==0)
        detected{i}='parasite';
    else
        detected{i}='plaquette';
    end
end
M=confusionmat(detected,class);
accuracy=(sum(sum(M.*eye(size(M))))/size(class,2))*100;