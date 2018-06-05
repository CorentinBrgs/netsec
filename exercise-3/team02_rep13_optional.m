function team02_rep13_optional
    [timestamps, bytes, ~, ~, ~] = read_custom_csv('~/workfiles/global_last10years.csv');
    % From visual inspection
    cutoff = 8*10^8;
    timestamps = timestamps(timestamps<=datenum('2014-01-01'));
    bytes = bytes(timestamps>0);
    
    peak_locations = bytes>cutoff;
    peak_timestamps = timestamps(peak_locations);
    peaks = bytes(peak_locations);
    
    dates = arrayfun(@datestr, peak_timestamps, 'UniformOutput', false);
    result = dates';
    result(2,:) = num2cell(peaks);
    fprintf('%s: %f Bytes\n', result{:});
    % NOTE: There is a gap because on 19-nov-2012 there was no data
end
