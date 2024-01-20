clc,clear
L = 100;
num_p = 6400;
phi_real = num_p*pi/(2*L)^2;
Pe = 10;
ft_name = 'times new roman';
linewid = 1.5;
ft_size = 12;
N_pe= length(Pe);
Dir = "Standing_wave/";
for i = 1:N_pe
    phiuvN  = load(Dir+"/Komograph_field_Pe"+Pe(i)+".mat").komo_phiuv_local;
    komo_t = phiuvN{1,1}; komo_V = phiuvN{1,2}; komo_phiV = phiuvN{1,3};
    komo_uH = phiuvN{2,4};
    time = komo_t(:,1); y = komo_V(1,:)*2;
    time_flag = [7000 7400]; num_color = 20;
    komo_wave_phi = komo_phiV;
    figure('Color','w');
    subplot(2,2,1);
    map_phi_line = gray(num_color);
    colororder(map_phi_line);
    for kk  = 1 : size(time)
        if time(kk) >=time_flag(1) && time(kk)<=time_flag(2)
            plot(y/(L*2),smooth(komo_wave_phi(kk,:),3)/phi_real-1,'-','LineWidth',linewid); hold on
        end
    end
    xlabel('y/L','Interpreter','latex');
    ylabel('$\langle \Phi_{\rm E} \rangle_x$','Interpreter','latex');
    ylim([-0.25 0.25]);
    colormap("gray");
    set(gca,'FontName',ft_name,'fontsize',ft_size,'LineWidth',linewid);
    subplot(2,2,2);
    map_phi_u = gray(num_color);
    colororder(map_phi_u);
    for kk  = 1 : size(time)
        if time(kk) >=time_flag(1) && time(kk)<=time_flag(2)
            plot(y/(L*2),smooth(komo_uH(kk,:),3),'-','LineWidth',linewid); hold on
        end
    end
    xlabel('y/L','Interpreter','latex');
    ylabel('$\langle V_{\rm E} \rangle_x$','Interpreter','latex');
    ylim([-0.07 0.07]);
    set(gca,'FontName',ft_name,'fontsize',ft_size,'LineWidth',linewid);
    Video_name_chr = convertStringsToChars(Dir+"/Pe"+Pe(i)+"Standing_wave_H.pdf");
    exportgraphics(gcf,Video_name_chr,'ContentType','vector');
end

