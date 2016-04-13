clear all;
clc; 
close all;

[data, headers] = LoadSensorData('train_0309.csv');
data = unique(data,'rows');
[sv, si]=PlotData(data, headers);

rooms = unique(data(:,1));
room_num = length(rooms);

for i = 1:room_num
    train_set_room{i} = data(data(:,1)==rooms(i),2:size(data,2))/100+1;
end
C=30;

%one vs one
for i = 1:room_num-1
    for j = i+1:room_num
        train_set_x_ij{i,j}=[train_set_room{i};train_set_room{j}];
        train_set_y_ij{i,j}=[ones(size(train_set_room{i},1),1);zeros(size(train_set_room{j},1),1)];
        model_ij{i,j}=svmTrain(train_set_x_ij{i,j}, train_set_y_ij{i,j}, C, @linearKernel, 1e-3, 20);
    end
end
save model.mat rooms headers model_ij room_num

