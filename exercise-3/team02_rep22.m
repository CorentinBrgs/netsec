function team02_rep22
    [ts, tcp, ~, ~] = read_custom_protocol_csv('~/workfiles/Feb2017_proto.csv');
    
    num_days = length(ts) / 24;
    
    tcp_packets = tcp(:,1);
    tcp_ip_s = tcp(:,2);
    
    function [mean_day, median_day, std_day] = average_day(data)
        days = reshape(data, [24, num_days]);
        % ... over the rows
        mean_day = mean(days, 2);
        median_day = median(days, 2);
        std_day = std(days, 0, 2);
    end

    function plot_day(data)
        [mean_day, median_day, std_day] = average_day(data);
        hours = 0:23;
        figure
        errorbar(hours, mean_day, std_day, 'r-')
        hold on
        errorbar(hours, median_day, std_day, 'g-')
        plot(hours, std_day, 'b-');
        legend({'mean', 'median', 'stddev'}, 'Location', 'southwest');
    end

    plot_day(tcp_packets)
    title('Packets');
    xlabel('hours');
    ylabel('# packets');
    saveas(gcf, 'plots/rep_22_packets.png', 'png')    
    
    plot_day(tcp_ip_s)
    xlabel('hours');
    title('IP sources');
    ylabel('# IP sources');
    saveas(gcf, 'plots/rep_22_ip_s.png', 'png')  
    
    % rep-23
    
    [packets_mean, packets_median] = average_day(tcp_packets);
    [ip_s_mean, ip_s_median] = average_day(tcp_ip_s);
    
    disp('mean');
    disp(corrcoef(packets_mean, ip_s_mean));
    disp('median');
    disp(corrcoef(packets_median, ip_s_median));
end