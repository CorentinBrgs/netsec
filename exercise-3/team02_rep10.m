rows = [2 3  4 5];
titles = {'bytes/hour', 'packets/hour', 'unique IP sources/hour', 'unique IP destinations/hour'};
filenames = {'rep_10_2', 'rep_10_1', 'rep_10_3', 'rep_10_4'};
ylabels = {'#bytes [million]' '#packets [million] ' '#unique IP sources [million]' '#unique IP destinations [million]'};

format long g
more off
set (gca, 'fontname', 'Helvetica', 'fontsize', 20)

idx = 0;
for rowindex = rows
    idx = idx +1;

    % Read in the data
    dataset = csvread('global_last10years.csv', 1, 0);

    data = dataset(:,rowindex);

    timestamps = datenum(1970, 1, 1, 0, 0, dataset(:,1));

    % Start a new figure
    figure
    % Do a stem plot
    stem(timestamps, data/10^6, 'marker', 'none')

    datetick('x', 'mm/yy');
    xlabel('days of observed time span');
    ylabel(ylabels{idx});
    title(titles{idx});
    grid on
    set (gca, 'layer', 'top');
    xlim([min(timestamps) max(timestamps)]);
    saveas(gcf, strcat("plots/", filenames{idx}), 'png')
end

% optional part
figure
data = dataset(:,3)
data = data ./ max(data);
b = (1/30)*ones(1,30);
a = 1;



plot(timestamps, smooth_pkts);
plot(timestamps, smooth_bytes);
plot(timestamps, smooth_ip_s);
plot(timestamps, smooth_ip_d);


%exit
