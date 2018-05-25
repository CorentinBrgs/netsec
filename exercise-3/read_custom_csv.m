function [ts, bytes, packets, ip_s, ip_d] = read_custom_csv(filename)
% Read the csv and return data
    data = csvread(filename, 1, 0);
    ts = epoch_to_date(data(:,1));
    bytes = data(:,2);
    packets = data(:,3);
    ip_s = data(:,4);
    ip_d = data(:,5);
end