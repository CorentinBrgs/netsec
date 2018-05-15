

% Nicer output
x = [3 2 4 5];
t= {'Packets per hour', 'Bytes per hour', 'uIP sources per hour', 'uIP destinations per hour'};
y= {'#packets [million]' '#Bytes [million] ' '#uIP sources [million]' '#uIP destinations [million]'};

idx = 0;

for rowindex = x
    idx = idx +1;
format long g
more off
set (gca, 'fontname', 'Helvetica', 'fontsize', 20)

% Read in the data
dataset = csvread('../../workfiles/global_last10years.csv', 1, 0);

data = dataset(:,rowindex);

timestamps = datenum(1970, 1, 1, 0, 0, dataset(:,1));

subplot(2,2,idx);
stem(timestamps, data/10^6, 'marker', 'none')
datetick('x', 'mm/yy');
xlabel('days of observed time span');
ylabel(y(idx));
title(t(idx));
grid on
set (gca, 'layer', 'top');
xlim([min(timestamps) max(timestamps)]);
saveas(gcf,t{idx},'png')
end