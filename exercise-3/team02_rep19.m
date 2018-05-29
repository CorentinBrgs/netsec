function team02_rep19()
    [ts, p445, p23, p502, p25, p22, p21, p443, p81, p80, p993] = read_tcp_ports_csv('~/workfiles/Feb2017_TCPdstport.csv');
    [tcp, ~, ~] = read_custom_protocol_csv('~/workfiles/Feb2017_proto.csv');

    function result = packets(data)
        result = data(:,1);
    end

    function result = ip_s(data)
        result = data(:,2);
    end

    function result = ip_d(data)
        result = data(:,3);
    end

    names = { ...
        'p445', 'p23', 'p502', ...
        'p25', 'p22', 'p21', ...
        'p443', 'p81', 'p80', 'p993'
    };
    [sums, idx] = sort([ ...
        sum(p445), sum(p23), sum(p502), sum(p25), sum(p22), ...
        sum(p21), sum(p443), sum(p81), sum(p80), sum(p993)
    ],  2, 'descend');
    names = names(idx);
    
    ports_names = [names(1) names(2) names(3) names(4)];
    ports_absolute = [p23 p22 p445 p80]
    ports_percentage = [p23 ./ packets(tcp), p22 ./ packets(tcp), p445 ./ packets(tcp), p80 ./ packets(tcp)]
    %cellfun(@(col) col./packets(tcp), num2cell(ports_absolute, 1), 'UniformOutput', false)

    mean(ports_percentage(:,1))
    mean(ports_percentage(:,2))
    mean(ports_percentage(:,3))
    mean(ports_percentage(:,4))
    disp('---');
    std(ports_percentage(:,1))
    std(ports_percentage(:,2))
    std(ports_percentage(:,3))
    std(ports_percentage(:,4))
    disp('--');
    mean(ports_absolute(:,1))
    mean(ports_absolute(:,2))
    mean(ports_absolute(:,3))
    mean(ports_absolute(:,4))
    disp('---');
    std(ports_absolute(:,1))
    std(ports_absolute(:,2))
    std(ports_absolute(:,3))
    std(ports_absolute(:,4))

% 
%     others_packets = packets(tcp) - packets(tcp) - packets(udp) - packets(icmp);
%     others_ip_s = combined_ip_s - ip_s(tcp) - ip_s(udp) - ip_s(icmp);
%     others_ip_d = combined_ip_d - ip_d(tcp) - ip_d(udp) - ip_d(icmp);
%     others = horzcat(others_packets, others_ip_s, others_ip_d);
%     
%     function result = percentages(data)
%         p = packets(data) ./ combined_packets;
%         s = ip_s(data) ./ combined_ip_s;
%         d = ip_d(data) ./ combined_ip_d;
%         result = horzcat(p, s, d);
%     end
%     
%     tcp_percentages = percentages(tcp);
%     udp_percentages = percentages(udp);
%     icmp_percentages = percentages(icmp);
%     others_percentages = percentages(others);
%     
%     function table(t, u, i, o)
%         fprintf('%f %f %f\n', mean(t), median(t), std(t));
%         fprintf('%f %f %f\n', mean(u), median(u), std(u));
%         fprintf('%f %f %f\n', mean(i), median(i), std(i));
%         fprintf('%f %f %f\n', mean(o), median(o), std(o));
%     end
% 
%     table(packets(tcp_percentages), packets(udp_percentages), packets(icmp_percentages), packets(others_percentages));
%     disp('--');
%     table(ip_s(tcp_percentages), ip_s(udp_percentages), ip_s(icmp_percentages), ip_s(others_percentages));
%     disp('--');
%     table(ip_d(tcp_percentages), ip_d(udp_percentages), ip_d(icmp_percentages), ip_d(others_percentages));
    
end
