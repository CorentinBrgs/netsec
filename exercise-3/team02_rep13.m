function team02_rep13
    [timestamps, ~, ~, ip_s, ~] = read_custom_csv('~/workfiles/global_last10years.csv');
    % from visual inspection
    cutoff = 1.5*10^6;
    peak_locations = ip_s>cutoff;
    
    peak_timestamps = timestamps(peak_locations);
    peaks = ip_s(peak_locations);
    
    dates = arrayfun(@datestr, peak_timestamps, 'UniformOutput', false);
    result = dates';
    result(2,:) = num2cell(peaks);
    fprintf('%s: %f IPs\n', result{:});
end
