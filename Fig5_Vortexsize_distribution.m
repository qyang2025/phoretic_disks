clc,clear
phi = 0.5;
Pe = 40;
color_index = 'k';
Dir = "Vortexsize_distribution/";
linewid = 2; 
ft_size = 15;
mk_size = 8;
N_pe = length(Pe);
Pe_legend = cell(1,N_pe*2);
figure('Color','w','Visible','on');
for i = 1:N_pe
    para  = load(Dir+"/PDF_Pe"+Pe(i)+".mat").PDF_Pe;
    R = para{1}(:,1)*2; PDF = para{1}(:,2); ell = para{2}*2;
    mll = mean(ell)
    sigma2 = var(ell)
    [fitresult, ~] = Gaussian_fit(R, PDF);
    a = fitresult.a; PDF_gaussian = a*exp(-0.5*(R-mll).^2/sigma2);
    plot(R,PDF,'b^','markersize',mk_size,'LineWidth',linewid); hold on
    plot(R,PDF_gaussian,'r-','LineWidth',linewid)
    Pe_legend{i} = "Pe="+num2str(Pe(i)/2);
end
y = linspace(0,0.5,100);
plot(mll+y*0,y,'b--','LineWidth',linewid);
xlim([0 15]);
ylim([0 0.7]);
Pe_legend{i*2} = "Gaussian";
legend(Pe_legend,'fontname','times new roman','location','best','fontsize',ft_size);legend box off;
xlabel('$l_{\mathrm{vtx}}$','Interpreter','latex');
ylabel('PDF','interpreter','latex');
set(gca,'fontsize',ft_size);
set(gca,'fontname','times new roman','linewidth',linewid);
box on
Video_name_chr = convertStringsToChars(Dir+"/Vortex_PDF.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');

function [fitresult, gof] = Gaussian_fit(R, PDF)
[xData, yData] = prepareCurveData( R, PDF );
%%%%% fit with same mean and variance
ft = fittype( 'a*exp(-0.5*(x-8.0683)^2/2.4845)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
[fitresult, gof] = fit( xData, yData, ft, opts );
end