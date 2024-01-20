clc,clear
Dir = "Orientational_correlation_function/";
Pe = [4.6 4.7 4.8 4.9 5];
symb = ['+','s','o','^','*','d'];
N_pe = length(Pe);
linewid = 2;
font_size = 16;
figure('color','w');
for i = 1:N_pe
    g6r  = load(Dir+"/g6r_Pe"+Pe(i)+".mat").g6rN;
    loglog(g6r{1}(:,1)*2,g6r{1}(:,2),'-','LineWidth',linewid); hold on
    loglog(g6r{1}(1:20:end,1)*2,g6r{1}(1:20:end,2),symb(i),'LineWidth',0.5);
end

r0 = linspace(13,50,100);
loglog(r0,1 + r0*0,'k--','linewidth',linewid);
loglog(r0,r0.^(-1/4),'-.','color','k','linewidth',linewid);
text(35,0.43,'$R^{-1/4}$','Interpreter','latex','FontSize',font_size,'color','k');
loglog(r0,5e-1*exp(-r0/40),'-.','color','k','linewidth',linewid);
xlabel('$R$','interpreter','latex');
ylabel('$g_6(R)$','interpreter','latex');
xlim([5 50]);
ylim([1e-1 1.1]);
h=legend('','Pe=2.3','','Pe=2.35','','Pe=2.4','','Pe=2.45','','Pe=2.5'...
    ,'interpreter','latex','location','south','NumColumns',1); legend box off;
set(gca,'fontsize',font_size);
set(gca,'TickLabelInterpreter','latex','linewidth',linewid);
box on
Video_name_chr = convertStringsToChars(Dir+"/Orientational_correlation_function.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');