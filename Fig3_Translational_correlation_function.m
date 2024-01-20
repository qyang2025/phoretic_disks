clc,clear
Dir = "Translational_correlation_function/";
Pe = [4.6 4.7 4.8 4.9 5.0];
symb = ['+','s','o','^','*','d'];
N_pe = length(Pe);
linewid = 2;
font_size = 16;
figure('color','w'); 
for i = 1:N_pe
    g12 = load(Dir+"/gqr_Pe"+Pe(i)+".mat").gqrN;
    loglog(g12{1}(:,1)*2,real(g12{1}(:,3)),'-','linewidth',linewid); hold on
    loglog(g12{1}(1:20:end,1)*2,real(g12{1}(1:20:end,3)),symb(i),'linewidth',0.5); hold on
end

r0=5:50;
loglog(r0,0.2e1*r0.^(-1/3),'k-','linewidth',linewid);
r=10:50;
loglog(r0,r0.^(0),'k--','linewidth',linewid);
loglog(r,9.5e-1*exp(-r/64),'k-.','linewidth',linewid);
loglog(r,9.5e-1*exp(-r/32),'k-.','linewidth',linewid);
loglog(r,8e-1*exp(-r/16),'k-.','linewidth',linewid);
loglog(r,7.5e-1*exp(-r/13),'k-.','linewidth',linewid);
text(8,1.2,'$R^{-1/3}$','Interpreter','latex');
ylabel('$g_{\mathbf{q}_0}(R)$','Interpreter','latex');
xlabel('$R$','Interpreter','latex');
xlim([5 50]);
ylim([1e-1 1.1]);
set(gca,'fontsize',font_size);
set(gca,'TickLabelInterpreter','latex','linewidth',linewid);
Video_name_chr = convertStringsToChars(Dir+"/Translational_correlation_function.pdf");   
exportgraphics(gcf,Video_name_chr,'ContentType','vector');