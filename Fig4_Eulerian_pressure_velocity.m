clc,clear
phi = 0.5;
Pe = [6 10];
color_index = [0 0 0;6/255 185/255 209/255];
Dir = "Eulerian_pressure_and_velocity/";
linetype = ["-.","-"];
n_gap = 1;
linewid = 1.5; 
ft_size = 14;
fig1 = figure('Color','w','Visible','on');
colororder([0 0 0;6/255 185/255 209/255]);
for i_Pe = 1:length(Pe)
    phic  = load(Dir+"/Travellingwave_Pe"+Pe(i_Pe)+".mat").PhiC;
    xrange = [0,12000];
    subplot(2,1,1)
    yyaxis left
    plot(phic{1}(1:n_gap:end,1),phic{1}(1:n_gap:end,4),linetype(i_Pe),'Color',color_index(1,:),'LineWidth',linewid); hold on
    ylabel("$\langle |\Phi_{\mathrm{E}}| \rangle_{xy}$",'Interpreter','latex');
    xlim(xrange)
    ylim([0 0.2])
    set(gca,'fontsize',ft_size);
    set(gca,'fontname','times new roman','linewidth',linewid);
    box on
    yyaxis right
    plot(phic{1}(1:n_gap:end,1),phic{1}(1:n_gap:end,5),linetype(i_Pe),'color',color_index(2,:),'LineWidth',linewid); hold on
    xlim(xrange)
    ylim([0 0.08]);
    xlabel("$t$",'Interpreter','latex');
    ylabel("$\langle |\mathbf{U}_{\mathrm{E}}| \rangle_{xy}$",'Interpreter','latex');
    set(gca,'fontsize',ft_size);
    set(gca,'fontname','times new roman','linewidth',linewid);
end
% legend('Pe=3','Pe=5','fontname','times new roman','location','east'); legend box off;
Video_name_chr = convertStringsToChars(Dir+"/Pe_Eulerian_pressure_velocity.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');