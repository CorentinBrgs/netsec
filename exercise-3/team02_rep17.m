function team02_rep17
    % TODO change filename
    [~, ~, combined_packets, combined_ip_s, combined_ip_d] = read_custom_csv('global_last10years.csv');
    [p1, p2, p3] = read_custom_protocol_csv('fake_data.csv');

    function result = calc_others(index, combined)
        known = sum([sum(p1(:,index)), sum(p2(:,index)), sum(p3(:,index))]);
        result = sum(combined) - known;
    end

    others(:,1) = calc_others(1, combined_packets);
    others(:,2) = calc_others(2, combined_ip_s);
    others(:,3) = calc_others(3, combined_ip_d);
    others
end