clear
close all
clc

load raw_00308744
data_1=raw_00308744;
load raw_00308748
data_2=raw_00308748;
load raw_00308766
data_3=raw_00308766;

I_1=imread('raw_00308744.bmp');
I_2=imread('raw_00308748.bmp');
I_3=imread('raw_00308766.bmp');

figure,imshow(I_1,[]);text(data_1(:,1),data_1(:,2),num2str(data_1(:,3)));title('Image 1');
figure,imshow(I_2,[]);text(data_2(:,1),data_2(:,2),num2str(data_2(:,3)));title('Image 2');
figure,imshow(I_3,[]);text(data_3(:,1),data_3(:,2),num2str(data_3(:,3)));title('Image 3');

disp('1-parasite    2-artefect   3-plaquette');

counter_1=0;
counter_2=0;
counter_3=0;

win=71;
k=(win-1)/2;
T=[];
for i=1:size(data_1,1)
    yloc=data_1(i,1)-k:data_1(i,1)+k;
    xloc=data_1(i,2)-k:data_1(i,2)+k;
    if(xloc(1)>0 && yloc(1)>0 && xloc(end)<size(I_1,1) && yloc(end)<size(I_1,2))
        im=I_1(xloc,yloc);
        if(data_1(i,3)==1)
            counter_1=counter_1+1;
            imwrite(im,strcat('parasite/',num2str(counter_1),'.jpg'));
        elseif(data_1(i,3)==2)
            counter_2=counter_2+1;
            imwrite(im,strcat('artefect/',num2str(counter_2),'.jpg'));
        else
            counter_3=counter_3+1;
            imwrite(im,strcat('plaquette/',num2str(counter_3),'.jpg'));
        end
    end
end

for i=1:size(data_2,1)
    yloc=data_2(i,1)-k:data_2(i,1)+k;
    xloc=data_2(i,2)-k:data_2(i,2)+k;
    if(xloc(1)>0 && yloc(1)>0 && xloc(end)<size(I_2,1) && yloc(end)<size(I_2,2))
        im=I_2(xloc,yloc);
        if(data_2(i,3)==1)
            counter_1=counter_1+1;
            imwrite(im,strcat('parasite/',num2str(counter_1),'.jpg'));
        elseif(data_2(i,3)==2)
            counter_2=counter_2+1;
            imwrite(im,strcat('artefect/',num2str(counter_2),'.jpg'));
        else
            counter_3=counter_3+1;
            imwrite(im,strcat('plaquette/',num2str(counter_3),'.jpg'));
        end
    end
end

for i=1:size(data_3,1)
    yloc=data_3(i,1)-k:data_3(i,1)+k;
    xloc=data_3(i,2)-k:data_3(i,2)+k;
    if(xloc(1)>0 && yloc(1)>0 && xloc(end)<size(I_3,1) && yloc(end)<size(I_3,2))
        im=I_3(xloc,yloc);
        if(data_3(i,3)==1)
            counter_1=counter_1+1;
            imwrite(im,strcat('parasite/',num2str(counter_1),'.jpg'));
        elseif(data_3(i,3)==2)
            counter_2=counter_2+1;
            imwrite(im,strcat('artefect/',num2str(counter_2),'.jpg'));
        else
            counter_3=counter_3+1;
            imwrite(im,strcat('plaquette/',num2str(counter_3),'.jpg'));
        end
    end
end


