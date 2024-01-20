clc,clear
phi = 0.12;
Pe = [4 5 6];
Dir = "Root_mean_square_U/";
linewid = 2; 
ft_size = 15;
figure('Color','w');
subplot(2,1,1);
N_pe = length(Pe);
Pe_legend = cell(1,N_pe);
for i = 1:N_pe
    U  = load(Dir+"/Uav_Pe"+Pe(i)+".mat").Uav_Pe;
    N_U = length(U{1});
    time = (1:N_U)*2-2;
    plot(time,U{1},'-','LineWidth',linewid); hold on
    Pe_legend{i} = "Pe="+num2str(Pe(i)/2);
end
legend(Pe_legend,'interpreter','latex','location','best','fontsize',ft_size,'NumColumns',N_pe);
legend box off;
ylim([-0.05,0.45]);
xlim([0 12000]);
xlabel('$t$','interpreter','latex');
ylabel('$ U_{\mathrm{rms}}$','interpreter','latex');
set(gca,'fontsize',ft_size);
set(gca,'TickLabelInterpreter','latex','linewidth',linewid);
box on
Video_name_chr = convertStringsToChars(Dir+"/Pe_U_RMS.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');