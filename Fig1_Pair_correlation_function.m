clc,clear
phi = 0.12; 
Pe = [4 5 6];
l = sqrt(2*pi/(sqrt(3)*phi)); 
Dir = "Pair_correlation_function/";
N_pe = length(Pe);
linewid = 2; 
ft_size = 15;
figure('Color','w');
for i = 1:N_pe
    subplot(3,1,i);
    gr  = load(Dir+"/Gr_Pe"+Pe(i)+".mat").Grr;
    ymax = max(gr{2})*1.1;
    if i == 1
        l1 = l;
        plot(gr{1}*2/l1,gr{2},'-','LineWidth',linewid); hold on
        x_hexatic = [1 sqrt(3) 2 sqrt(7) 3 sqrt(12) sqrt(13) 4];
        y_hexatic = linspace(0,ymax,10);
        for k =1:length(x_hexatic)
            plot(x_hexatic(k) + 0*y_hexatic,y_hexatic,'k-');
        end
        xlim([0 4]);
    elseif i==2
        plot(gr{1}*2,gr{2},'-','LineWidth',linewid); hold on
        ylabel('$g(R)$','Interpreter','latex');
        xlim([0 30]);
    else
        plot(gr{1}*2,gr{2},'-','LineWidth',linewid);
        x_zoom = [3 3 10 10];
        y_zoom = [0 5 5 0];
        patch(x_zoom,y_zoom,'','FaceColor','none');
        xlabel('$R$','Interpreter','latex');
        xlim([0 20]);
    end
    ylim([0 ymax]);
    set(gca,'fontsize',ft_size);
    set(gca,'linewidth',linewid);
    box on
end
Video_name_chr = convertStringsToChars(Dir+"/Pe_RDF.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');