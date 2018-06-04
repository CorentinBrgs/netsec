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

    function plot_day(data, filename)
        [mean_day, median_day, std_day] = average_day(data);
        hours = 0:23;
        figure
        plot(hours, mean_day, 'r-')
        hold on
        plot(hours, median_day, 'g-')
        plot(hours, std_day, 'b-')
        legend('mean', 'median', 'stddev');
        saveas(gcf, strcat('plots/rep_22_', filename, '.png'), 'png')
    end

    plot_day(tcp_packets, 'packets')
    plot_day(tcp_ip_s, 'ip_s')
    
    % rep-23
    
    [packets_mean, packets_median] = average_day(tcp_packets);
    [ip_s_mean, ip_s_median] = average_day(tcp_ip_s);
    
    corrcoef(packets_mean, ip_s_mean)
    corrcoef(packets_median, ip_s_median)
end