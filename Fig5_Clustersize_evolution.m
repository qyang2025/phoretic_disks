clc,clear
phi = 0.5;
Pe = 40;
ex = "_L100";
Dir = "Clustersize_evolution/";
linewid = 1.5; ft_size = 14;
figure('Color','w'); 
subplot(2,1,1);
N_pe = length(Pe);
Pe_legend = cell(1,N_pe); 
sizeN  = load(Dir+"/Clustersize_Pe"+Pe+".mat").Clustersize;
time = sizeN{1}(:,1); N_t = length(time); ind = 1:10:N_t;
colororder({'r','b'})
subplot(2,1,1)
plot(time(ind),sizeN{1}(ind,end)*2,'b-','LineWidth',linewid);  hold on ;
ell = mean(sizeN{1}(:,end)*2);
plot(time(ind),ell+time(ind)*0,'b--','LineWidth',linewid);
ylim([0,200]);
xlim([6000 8000]);
xlabel('$t$','interpreter','latex');
ylabel('$ \ell_{\rm clu}$','interpreter','latex');
set(gca,'fontsize',ft_size);
set(gca,'fontname','times new roman','linewidth',linewid);
box on
Video_name_chr = convertStringsToChars(Dir+"/Cluster_size.pdf");   
exportgraphics(gcf,Video_name_chr,'ContentType','vector');