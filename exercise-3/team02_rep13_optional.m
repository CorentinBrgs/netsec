function team02_rep13_optional
    [timestamps, bytes, ~, ~, ~] = read_custom_csv('~/workfiles/global_last10years.csv');
    
    timestamps = timestamps(timestamps<=datenum('2014-01-01'));
    bytes = bytes(timestamps>0);
    % FIXME: Recheck if the data is seperated
    [peaks, dates] = findpeaks(bytes, timestamps, 'MinPeakHeight', 5*10^8);
    dates = arrayfun(@datestr, dates, 'UniformOutput', false);
    result = dates';
    result(2,:) = num2cell(peaks);
    fprintf('%s: %f Bytes\n', result{:});
end
