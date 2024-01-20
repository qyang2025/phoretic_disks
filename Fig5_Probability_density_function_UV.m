clc,clear
phi = 0.5;
Pe = [10 40];
color_index = {'k','b'};
symb = ['^','^'];
file_type = ".pdf";
cont_type = "vector";
Dir = "PDF_UV/";
linewid = 2;
ft_size = 15;
mk_size = 8;
N_Re = length(Pe);
Re_legend = cell(1,N_Re);
variable = ["u","v"];
N_variable = length(variable);
ind_Re =1:N_Re;
for ind = 1:N_variable
    figure('Color','w','Visible','on');
    for i = ind_Re
        pdf  = load(Dir+"/PDF_Pe"+Pe(i)+".mat").PDF_Pe;
        if Pe(i)==10
            semilogy(pdf{ind}(:,1),pdf{ind}(:,2),symb(i),'markersize',mk_size,'linewidth',linewid,'color',color_index{i},'MarkerFaceColor',color_index{i}); hold on
        else
            semilogy(pdf{ind}(:,1),pdf{ind}(:,2),symb(i),'markersize',mk_size,'linewidth',linewid,'color',color_index{i}); hold on
        end
        ylim([1e-4 1.2]);
        xlim([-5 5]);
        Re_legend{i} = "Pe="+num2str(Pe(i)/2);
    end
    x1 = linspace(-5,5,100); 
    unit_gauss(x1,'r');
    legend(Re_legend{ind_Re},'interpreter','latex','location','south','fontsize',ft_size);legend box off;
    xlabel('$(s-\langle s\rangle)/\sigma_s$','Interpreter','latex');
    ylabel('PDF','interpreter','latex');
    set(gca,'fontsize',ft_size);
    set(gca,'TickLabelInterpreter','latex','linewidth',linewid);
    box on
    Video_name_chr = convertStringsToChars(Dir+"/PDF_"+variable(ind)+file_type);
    exportgraphics(gcf,Video_name_chr,'ContentType',cont_type);
end

