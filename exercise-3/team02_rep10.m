function team02_rep10
% rep-10
    [timestamps, bytes, packets, ip_s, ip_d] = read_custom_csv('global_last10years.csv');

    function save_stem_plot(data, my_title, y_label, filename)
    % Do a stem plot of data in millions and write it to filename.png
        set (gca, 'fontname', 'Helvetica', 'fontsize', 20)
        figure
        stem(timestamps, data/10^6, 'marker', 'none')
        datetick('x', 'mm/yy');
        xlabel('days of observed time span');
        ylabel(y_label);
        title(my_title);
        grid on
        set(gca, 'layer', 'top');
        xlim([min(timestamps) max(timestamps)]);
        saveas(gcf, filename, 'png')
    end

    save_stem_plot(bytes, 'bytes per hour', '#bytes [million]', 'plots/rep_10_2');
    save_stem_plot(packets, 'packets per hour', '#packets [million]', 'plots/rep_10_1');
    save_stem_plot(ip_s, 'ip sources per hour', '#ip sources [million]', 'plots/rep_10_3');
    save_stem_plot(ip_d, 'ip destinations per hour', '#ip destinations [million]', 'plots/rep_10_4');

    % optional part

    function result = smooth_filter(data)
    % Moving averages filter for data
        window_size = 30;
        b = (1 / window_size) * ones(1, window_size);
        a = 1;
        % 1-D digital filter
        result = filter(b, a, data);
    end

    smooth_bytes = smooth_filter(bytes / unique(max(bytes)));
    smooth_packets = smooth_filter(packets / unique(max(packets)));
    smooth_ip_s = smooth_filter(ip_s / unique(max(ip_s)));
    smooth_ip_d = smooth_filter(ip_d / unique(max(ip_d)));

    figure
    plot(...
        timestamps, smooth_bytes, '-', ...
        timestamps, smooth_packets, '-', ...
        timestamps, smooth_ip_s, '-', ...
        timestamps, smooth_ip_d, '-' ...
    );
    legend('bytes', 'packets', 'ip source', 'ip dest');
    datetick('x', 'mm/yy');
    xlabel('days of observed time span');
    title("Combined plot of normalized and smoothed signals");
    grid on
    set(gca, 'layer', 'top');
    xlim([min(timestamps) max(timestamps)]);
    saveas(gcf, 'plots/rep_10_optional', 'png')
end
