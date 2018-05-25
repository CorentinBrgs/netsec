function team02_rep12
    [~, ~, ~, ip_s, ip_d] = read_custom_csv('global_last10years.csv');
    ip_s(ip_s==0) = NaN;
    ip_d(ip_d==0) = NaN;
    
    fprintf('Ratio IPs to IPd: %f\n', nanmean(ip_s) / nanmean(ip_d));
end
