function [tcp, udp, icmp] = read_custom_protocol_csv(filename)
    % Read the csv and return data
    data = csvread(filename, 1, 0);
    % timestamp = data(:,1);
    tcp = data(:,2:4);
    udp = data(:,5:7);
    icmp = data(:,8:10);
%end