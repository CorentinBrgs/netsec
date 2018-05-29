% timestamp, 445,23,502,25,22,21,443,81,80,993
function [ts, p445, p23, p502, p25, p22, p21, p443, p81, p80, p993] = read_tcp_ports_csv(filename)
    % Read the csv and return data
    data = csvread(filename, 1, 0);
    ts = data(:, 1);
    p445 = data(:, 2);
    p23 = data(:, 3);
    p502 = data(:, 4);
    p25 = data(:, 5);
    p22 = data(:, 6);
    p21 = data(:, 7);
    p443 = data(:, 8);
    p81 = data(:, 9);
    p80 = data(:, 10);
    p993 = data(:, 11);
end