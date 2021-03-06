function team02_rep20()
    [port_data, column_names] = read_tcp_ports_csv('~/workfiles/Feb2017_TCPdstport.csv');
    
    ts = epoch_to_date(port_data(:,1));
    % We don't want to analyze the timestamp
    port_data = port_data(:,2:end);
    column_names = column_names(:,2:end);

    means = mean(port_data);
    medians = median(port_data);

    function result = difference(means_, medians_)
        result = abs((means_ - medians_) ./ medians_);
    end 

    [~, idx] = sort(bsxfun(@difference, means, medians));
    column_names = column_names(idx);
    means = means(idx);
    medians = medians(idx);
    port_data = port_data(:,idx);

    L_name = column_names(1);
    L_mean = means(1);
    L_median = medians(1);
    L = port_data(:,1);

    H_name = column_names(end);
    H_mean = means(end);
    H_median = medians(end);
    H = port_data(:,end);

    set(gca, 'fontname', 'Helvetica', 'fontsize', 20)

    figure
    subplot(2, 2, 1);
    plot(ts, L);
    hold on;
    plot(xlim, [L_mean, L_mean], 'r');
    plot(xlim, [L_median, L_median], 'g');
    legend('signal', 'mean', 'median');
    title(strcat(L_name, ' (L)'));
    ylabel('# packets / hour');
    datetick('x', 'dd');
    xlabel('days of Feb 2017');
    grid on
    set(gca, 'layer', 'top');

    subplot(2, 2, 2);
    plot(ts, H);
    hold on;
    plot(xlim, [H_mean, H_mean], 'r');
    plot(xlim, [H_median, H_median], 'g');
    legend('signal', 'mean', 'median');
    title(strcat(H_name, ' (H)'));
    ylabel('# packets / hour');
    datetick('x', 'dd');
    xlabel('day of Feb 2017');
    grid on
    set(gca, 'layer', 'top');
    
    subplot(2, 2, 3);
    histogram(L, 100, 'Normalization', 'probability');
    hold on;
    line([L_mean, L_mean], ylim, 'Color', 'r');
    line([L_median, L_median], ylim, 'Color', 'g');    
    legend('signal', 'mean', 'median');
    title(strcat(L_name, ' (L)'));
    grid on
    xlabel('#packets / hour');
    set(gca, 'layer', 'top');
    
    subplot(2,2,4);
    histogram(H, 100, 'Normalization', 'probability');
    line([H_mean, H_mean], ylim, 'Color', 'r');
    line([H_median, H_median], ylim, 'Color', 'g');
    legend('signal', 'mean', 'median');
    title(strcat(H_name, '(H)'));
    grid on
    xlabel('#packets / hour');
    set(gca, 'layer', 'top');

    saveas(gcf, 'plots/rep_20.png', 'png')
end
