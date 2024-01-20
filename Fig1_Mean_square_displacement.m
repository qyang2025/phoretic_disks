clc,clear
phi = 0.12;
Pe = [4 5 6];
Dir = "Mean_square_displacement/";
linewid = 2; ft_size = 15;
figure('Color','w'); 
subplot(2,1,1);
N_pe = length(Pe);
Pe_legend = cell(1,N_pe);
for i = 1:N_pe
    MSD  = load(Dir+"/MSD_Pe"+Pe(i)+".mat").MSDN;
    N_U = length(MSD{1}(:,1));
    time = MSD{1}(:,1)*2;
    loglog(time,MSD{1}(:,2),'-','LineWidth',linewid); hold on
    Pe_legend{i} = "Pe="+num2str(Pe(i)/2);
end
time0 = linspace(2,50,100);
time1 = linspace(1000,max(time),100);
loglog(time0, 2e-2*time0.^2,'-.','color','k','linewidth',linewid);
loglog(time1, 5e-1*time1,'--','color','k','linewidth',linewid);
loglog(time1, 1e-2*time1.^(0.75),'--','color','k','linewidth',linewid);
legend(Pe_legend,'interpreter','latex','location','best','fontsize',ft_size,'NumColumns',N_pe);
legend box off;
xlim([1,8000])
xlabel('$\tau$','interpreter','latex');
ylabel('MSD($\tau$)/$\ell^2$','interpreter','latex');
set(gca,'fontsize',ft_size);
set(gca,'TickLabelInterpreter','latex','linewidth',linewid);
box on
Video_name_chr = convertStringsToChars(Dir+"/Pe_MSD.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');