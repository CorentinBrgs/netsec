function team02_rep21()
    [ts, tcp, ~, ~] = read_custom_protocol_csv('~/workfiles/Feb2017_proto.csv');
    
    N = length(ts);
    N2 = floor(N/2);
    
    tcp_packets = tcp(:,1);
    tcp_ip_s = tcp(:,2);
    
    % (a)
    
    figure
    subplot(1, 2, 1);
    plot(epoch_to_date(ts), tcp_packets);
    title('Packets');
    ylabel('# packets / hour');
    datetick('x', 'mm/dd');

    
    subplot(1, 2, 2);
    plot(epoch_to_date(ts), tcp_ip_s);
    title('IP source');
    ylabel('# IP source / hour');
    datetick('x', 'mm/dd');

    saveas(gcf, 'plots/rep_21_a.png', 'png')
    
    function plot_spectrum(amplitudes)
        k = (1:(N2+1));
        stem(k, amplitudes(1:(N2 + 1)), 'marker', 'none'); 
        xlim([1 N2+1]);
        xlabel('k');
        ylabel('Amplitude');
    end
    
    function [a, offset] = amplitudes(data)
        data(data == 0) = median(data);
        data_fft = fft(data);
        data_abs = abs(data_fft);
        a = data_abs(2:end);
        offset = data(1);
    end
    
    function f = freq(k)
        f = k / N;
    end

    function p = period(k)
        p = N / k;
    end

    packet_amp = amplitudes(tcp_packets);
    ip_s_amp = amplitudes(tcp_ip_s);
    
    % (b) 
    
    figure
    subplot(1, 2, 1);
    plot_spectrum(packet_amp);
    title('Packet spectrum');
    subplot(1, 2, 2);
    plot_spectrum(ip_s_amp);
    title('IPs spectrum');
    
    saveas(gcf, 'plots/rep_21_b.png', 'png')

    %[v, k] = max(a(2:end));
    %freq(k)
    %period(k)
    
    function max_fft_info(amplitudes)
        [v, k] = max(amplitudes);
        fprintf('max: %.3f max_k: %d period: %.3f hours (%.3f days)\n', v, k, period(k), period(k) / 24);
    end

    % (c)
    max_fft_info(packet_amp);
    max_fft_info(ip_s_amp);
    
    [max_amps max_ks] = sort(packet_amp, 'descend');
    
    function report_fft(max_amps, max_ks)
        for i=1:20
            disp(max_amps(i));
            disp(period(max_ks(i)) / 24);
            disp(period(max_ks(i)));
            disp('--');
        end
    end
    
    disp('packets');
    [a, k] = sort(packet_amp, 'descend');
    report_fft(a, k);
    
    disp('ip_s');
    [a, k] = sort(ip_s_amp, 'descend');
    report_fft(a, k);
 

end