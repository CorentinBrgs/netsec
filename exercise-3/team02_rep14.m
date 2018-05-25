function team02_rep14

    function result = stats(data)
        data(data==0) = NaN;
        result = round([nansum(data), nanmean(data), nanmedian(data), nanstd(data)] ./ 10e6, 3);
    end

    [~, bytes, packets, ip_s, ip_d] = read_custom_csv('global_last10years.csv');
    for col = horzcat(bytes, packets, ip_s, ip_d)
        fprintf('%.3f %.3f %.3f %.3f\n', stats(col));
    end
    
    disp('-----');
    
    [~, bytes, packets, ip_s, ip_d] = read_custom_csv('global_last10years.csv');
    for col = horzcat(bytes, packets, ip_s, ip_d)
        fprintf('%.3f %.3f %.3f %.3f\n', stats(col));
    end
end
