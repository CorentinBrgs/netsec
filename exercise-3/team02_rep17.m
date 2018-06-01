function team02_rep17
    % TODO change filename
    % WARNING: order is switched
    [~, combined_packets, ~, combined_ip_s, combined_ip_d] = read_custom_csv('~/workfiles/Feb2017_gen.csv');
    [~, tcp, udp, icmp] = read_custom_protocol_csv('~/workfiles/Feb2017_proto.csv');
    % packets, ip_s, ip_d
    
   function result = packets(data)
        result = data(:,1);
    end

    function result = ip_s(data)
        result = data(:,2);
    end

    function result = ip_d(data)
        result = data(:,3);
    end   

    others_packets = combined_packets - packets(tcp) - packets(udp) - packets(icmp);
    others_ip_s = combined_ip_s - ip_s(tcp) - ip_s(udp) - ip_s(icmp);
    others_ip_d = combined_ip_d - ip_d(tcp) - ip_d(udp) - ip_d(icmp);
    others = horzcat(others_packets, others_ip_s, others_ip_d);
    
    function result = percentages(data)
        p = packets(data) ./ combined_packets;
        s = ip_s(data) ./ combined_ip_s;
        d = ip_d(data) ./ combined_ip_d;
        result = horzcat(p, s, d);
    end
    
    tcp_percentages = percentages(tcp);
    udp_percentages = percentages(udp);
    icmp_percentages = percentages(icmp);
    others_percentages = percentages(others);
    
    function table(t, u, i, o)
        fprintf('%f %f %f\n', mean(t), median(t), std(t));
        fprintf('%f %f %f\n', mean(u), median(u), std(u));
        fprintf('%f %f %f\n', mean(i), median(i), std(i));
        fprintf('%f %f %f\n', mean(o), median(o), std(o));
    end

    table(packets(tcp_percentages), packets(udp_percentages), packets(icmp_percentages), packets(others_percentages));
    disp('--');
    table(ip_s(tcp_percentages), ip_s(udp_percentages), ip_s(icmp_percentages), ip_s(others_percentages));
    disp('--');
    table(ip_d(tcp_percentages), ip_d(udp_percentages), ip_d(icmp_percentages), ip_d(others_percentages));
    
    function stat_plot(data, my_title)
        figure
        ax1 = subplot(1, 3, 1);
        boxplot(ax1, packets(data), 'Labels', {''})
        ylabel(ax1, 'Packets');
        xlabel(ax1, 'Packets / hour');
        
        ax2 = subplot(1, 3, 2);
        boxplot(ax2, ip_s(data), 'Labels', {''})
        ylabel(ax2, 'IPs');
        xlabel(ax2, 'IPs / hour');
        title(my_title)      
        
        ax3 = subplot(1, 3, 3);
        boxplot(ax3, ip_d(data), 'Labels', {''})
        ylabel(ax3, 'IPd');
        xlabel(ax3, 'IPd / hour');
        
        grid on
        set(gca, 'layer', 'top');
        saveas(gcf, strcat('plots/rep_17_', my_title, '.png'), 'png')
    end
    
    stat_plot(tcp_percentages, 'TCP')
    stat_plot(udp_percentages, 'UDP')
    stat_plot(icmp_percentages, 'ICMP')
    stat_plot(others_percentages, 'OTHERS')
    
    % Optional part
    
    function plot_scatter(fun_x, fun_y, label_x, label_y)
        figure
        scatter(fun_x(tcp_percentages), fun_y(tcp_percentages), '.r');
        hold on
        scatter(fun_x(udp_percentages), fun_y(udp_percentages), '.b');
        scatter(fun_x(icmp_percentages), fun_y(icmp_percentages), '.g');
        scatter(fun_x(others_percentages), fun_y(others_percentages), '.m');
        legend({'tcp', 'udp', 'icmp', 'others'}, 'Location', 'southeast');
        ylabel(label_y);
        xlabel(label_x);
        grid on;
        set(gca, 'layer', 'top');
        saveas(gcf, strcat('plots/rep_17_optional_', label_x, label_y, '.png'), 'png')
    end

    plot_scatter(@ip_s, @ip_d, 'IPs', 'IPd');
    plot_scatter(@ip_s, @packets, 'IPs', 'Packets');
    plot_scatter(@ip_d, @packets, 'IPd', 'Packets');
    

end
