function team02_rep13
    [timestamps, ~, ~, ip_s, ~] = read_custom_csv('global_last10years.csv');
    [peaks, dates] = findpeaks(ip_s, timestamps, 'MinPeakHeight', 1.5*10^6);
    dates = arrayfun(@datestr, dates, 'UniformOutput', false);
    result = dates';
    result(2,:) = num2cell(peaks);
    fprintf('%s: %f IPs\n', result{:});
end