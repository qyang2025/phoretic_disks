clc,clear
L=100;
num_p = 6400;
phi_real = num_p*pi/(2*L)^2;
Pe = [10 20];
Dir = "Periodic_wave_breakdown/";
linewid = 1.5; ft_size = 14;
fig1 = figure('Color','w','Visible','on');
for i_Pe = 1:length(Pe)
    subplot(2,1,i_Pe)
    phic  = load(Dir+"/Travellingwave_Pe"+Pe(i_Pe)+".mat").PhiC;
    xrange = [0,12000];
    plot(phic{1}(:,1),phic{1}(:,2)/phi_real-1,'-','Color','k','LineWidth',linewid);
    xlabel('t','Interpreter','latex');
    ylabel("$\langle \Phi_{\rm E}|_{x=\frac{L}{2}} \rangle$",'Interpreter','latex');
    xlim(xrange)
    ylim([-0.4  0.4])
    set(gca,'fontsize',ft_size);
    set(gca,'fontname','times new roman','linewidth',linewid);
    box on
end
Video_name_chr = convertStringsToChars(Dir+"/Pe_Wave_breakdown.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');