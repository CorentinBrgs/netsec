function team02_rep14

    function result = stats(data)
        data(data==0) = NaN;
        result = round([nansum(data), nanmean(data), nanmedian(data), nanstd(data)] ./ 10e6, 3);
    end

    disp('---- Daily avg ---');
    [~, bytes, packets, ip_s, ip_d] = read_custom_csv('~/worfiles/global_last10years.csv');
    for col = horzcat(bytes, packets, ip_s, ip_d)
        fprintf('%.3f %.3f %.3f %.3f\n', stats(col));
    end
    
    disp('----- Hourly avg ---');
    
    % WARNING: order is different
    [~, packets, bytes, ip_s, ip_d] = read_custom_csv('~/workfiles/Feb2017_gen.csv');
    for col = horzcat(bytes, packets, ip_s, ip_d)
        fprintf('%.3f %.3f %.3f %.3f\n', stats(col));
    end
end
