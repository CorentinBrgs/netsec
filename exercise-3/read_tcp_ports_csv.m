% timestamp, 445,23,502,25,22,21,443,81,80,993
function [data, column_names] = read_tcp_ports_csv(filename)
    % Read the csv and return data and column names
    
    column_names = { ...
        'ts', 'p445', 'p23', 'p502', 'p25', 'p22', 'p21', ...
        'p443', 'p81', 'p80', 'p993'
    };
    data = csvread(filename, 1, 0);
end