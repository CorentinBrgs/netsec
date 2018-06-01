function team02_rep19()
    [port_data, column_names] = read_tcp_ports_csv('~/workfiles/Feb2017_TCPdstport.csv');
    [~, tcp, ~, ~] = read_custom_protocol_csv('~/workfiles/Feb2017_proto.csv');

    tcp_packets = tcp(:,1);
    % for element-wise division later on
    tcp_packets = horzcat(tcp_packets, tcp_packets, tcp_packets, tcp_packets);

    % We don't want the timestamp
    port_data = port_data(:,2:end);
    column_names = column_names(:,2:end);
    
    % Sum over the columns and sort descending
    [~, idx] = sort(sum(port_data), 'descend');
    
    port_data = port_data(:,idx);
    port_data = port_data(:,1:4);
    
    column_names = column_names(idx);    
    fprintf('Most used ports: %s %s %s %s\n', column_names{:,1:4});
    
    % Absolute values
    disp('Absolute');
    fprintf('mean %.3f %.3f %.3f %.3f\n', (mean(port_data) ./ 10e6));
    fprintf('std  %.3f %.3f %.3f %.3f\n', (std(port_data) ./ 10e6));
    
    disp('Perc');
    fprintf('mean %.1f %.1f %.1f %.1f\n', mean(port_data ./ tcp_packets) * 100);
    fprintf('std  %.1f %.1f %.1f %.1f\n', std(port_data ./ tcp_packets) * 100); 
end
