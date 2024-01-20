%% run more times if the fitting failed
clc,clear
L = 100;
Pe = [10 20];
color_index= ['k','k'];
face_color = ['k','none'];
marker = ['^','^'];
ex = "_L100";
Dir = "Clustersize_distribution/";
linewid = 1.5;
ft_size = 14;
mk_size = 8;
N_pe = length(Pe);
Pe_legend = cell(1,N_pe);
figure('Color','w');
x = 1:500;
A = 0; b = 0; c = 0;
for i = 1:N_pe
    if i==1
        ind = 1:16;
    else
        ind = 1:100;
    end
    pdf  = load(Dir+"/PDF_Pe"+Pe(i)+".mat").PDF_clusterN;
    n = pdf{2}(:,1);
    p = pdf{2}(:,2);
    n0 = n(ind);
    p0 = log(p(ind));
    [fitresult, gof] = pdf_clusterfit(n0, p0);
    A = fitresult.A;    
    b = fitresult.b; 
    c = fitresult.c;
    y = A*x.^(-b).*exp(-x/c);
    loglog(n,p,marker(i),'LineWidth',linewid,'color',color_index(i),'MarkerSize',mk_size,'MarkerFaceColor',face_color(i)); hold on
    semilogy(x,y,'r-','linewidth',linewid*2)
end
ylim([1e-6 10]);
xlim([0 1000]);
xlabel('$N_{\rm clu}$','Interpreter','latex');
ylabel('$P(N_{\rm clu})$','Interpreter','latex');
set(gca,'fontsize',ft_size);
set(gca,'fontname','times new roman','linewidth',linewid);
box on
Video_name_chr = convertStringsToChars(Dir+"/Pe_Clustersize.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');
%%

function [fitresult, gof] = pdf_clusterfit(n, p)
[xData, yData] = prepareCurveData( n, p );
ft = fittype( 'log(A)-b*log(x) -x/c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
[fitresult, gof] = fit( xData, yData, ft, opts );
end