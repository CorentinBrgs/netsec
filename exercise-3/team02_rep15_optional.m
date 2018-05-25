function team02_rep15_optional
    [~, bytes_daily, packets_daily, ip_s_daily, ip_d_daily] = read_custom_csv('global_last10years.csv');
    [~, bytes_hourly, packets_hourly, ip_s_hourly, ip_d_hourly] = read_custom_csv('global_last10years.csv');

    set (gca, 'fontname', 'Helvetica', 'fontsize', 20)

    ax1 = subplot(2,4,1);
    boxplot(ax1, bytes_hourly, 'Labels', {''})
    ylabel(ax1, 'Bytes');
    xlabel(ax1, 'Bytes / hour');
    grid on
    set(gca, 'layer', 'top');

    ax2 = subplot(2,4,2);
    boxplot(ax2, packets_hourly, 'Labels', {''})
    ylabel(ax2, 'Packets');
    xlabel(ax2, 'Packets / hour');
    grid on
    set(gca, 'layer', 'top');

    ax3 = subplot(2,4,3);
    boxplot(ax3, ip_s_hourly, 'Labels', {''})
    ylabel(ax3, 'IPs');
    xlabel(ax3, 'IPs / hour');
    grid on
    set(gca, 'layer', 'top');

    ax4 = subplot(2,4,4);
    boxplot(ax4, ip_d_hourly, 'Labels', {''})
    ylabel(ax4, 'IPd');
    xlabel(ax4, 'IPd / hour');
    grid on
    set(gca, 'layer', 'top');

    ax5 = subplot(2,4,5);
    boxplot(ax5, bytes_daily, 'Labels', {''})
    ylabel(ax5, 'Bytes');
    xlabel(ax5, 'Bytes / day');
    grid on
    set(gca, 'layer', 'top');

    ax6 = subplot(2,4,6);
    boxplot(ax6, packets_daily, 'Labels', {''})
    ylabel(ax6, 'Packets');
    xlabel(ax6, 'Packets / day');
    grid on
    set(gca, 'layer', 'top');

    ax7 = subplot(2,4,7);
    boxplot(ax7, ip_s_daily, 'Labels', {''})
    ylabel(ax7, 'IPs');
    xlabel(ax7, 'IPs / day');
    grid on
    set(gca, 'layer', 'top');

    ax8 = subplot(2,4,8);
    boxplot(ax8, ip_d_daily, 'Labels', {''})
    ylabel(ax8, 'IPd');
    xlabel(ax8, 'IPd / day');
    grid on
    set(gca, 'layer', 'top');

    saveas(gcf, 'plots/rep_15_optional.png', 'png')
end
