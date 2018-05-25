function [proto1, proto2, proto3] = read_custom_protocol_csv(filename)
    % Read the csv and return data
    data = csvread(filename, 1, 0);
    proto1 = data(:,1:3);
    proto2 = data(:,4:6);
    proto3 = data(:,7:9);
%end