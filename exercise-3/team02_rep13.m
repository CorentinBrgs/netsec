function team02_rep13
    [timestamps, ~, ~, ip_s, ~] = read_custom_csv('~/workfiles/global_last10years.csv');
    % FIXME Recheck if the data is really seperated
    [peaks, dates] = findpeaks(ip_s, timestamps, 'MinPeakHeight', 1.5*10^6);
    dates = arrayfun(@datestr, dates, 'UniformOutput', false);
    result = dates';
    result(2,:) = num2cell(peaks);
    fprintf('%s: %f IPs\n', result{:});
end
