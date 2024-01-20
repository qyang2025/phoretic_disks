clc,clear
Pe = 40;
linewid = 2;
ft_size = 15;
ell_clu = 87.16;
ell_vtx = 8.1;
Dir = "Energy_spectrum/";
size = ["_Large",""];
figure('Color','w','Visible','on');
for kk = 1:length(size)
    Eq  = load(Dir+"/PSD_Pe"+Pe+size(kk)+".mat").Eq;
    h = loglog(Eq(:,1),Eq(:,2),'-','linewidth',linewid,'color','k'); hold on
    h.Color(4) = (4-kk)*0.3;
end
Pe_legend{1} = "Pe="+num2str(Pe/2)+", L=400";
Pe_legend{2} = "Pe="+num2str(Pe/2)+", L=200";
qr0 = linspace(0.005,0.02,100);
loglog(qr0,8*qr0.^(4/3),'k-.','linewidth',linewid);
qr0 = linspace(0.025,0.1,100);
loglog(qr0,3e-3*qr0.^(-2/3),'k:','linewidth',linewid);
qr0 = linspace(0.12,0.35,100);
loglog(qr0,3.5e-4*qr0.^(-5/3),'k--','linewidth',linewid);
y = linspace(1e-6,1,100);
plot(2/ell_clu+y*0,y,'b--');
plot(2/ell_vtx+y*0,y,'b--');
Pe_legend{kk+1} = "$\hat{q}^{4/3}$";
Pe_legend{kk+2} = "$\hat{q}^{-2/3}$";
Pe_legend{kk+3} = "$\hat{q}^{-5/3}$";
ylim([5e-6 1e-1]);
xlim([5e-3 0.8]);
legend(Pe_legend,'interpreter','latex','location','southwest','fontsize',ft_size);legend box off;
xlabel('$\hat{q}/q_c$','Interpreter','latex');
ylabel('$E(\hat{q})$','interpreter','latex');
set(gca,'fontsize',ft_size);
set(gca,'TickLabelInterpreter','latex','linewidth',linewid);
box on
Video_name_chr = convertStringsToChars(Dir+"/PSD_Pe.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');