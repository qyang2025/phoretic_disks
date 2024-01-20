clc,clear
Pe = [10 40];
symb = ['^','^'];
ex = "_L100";
file_type = ".pdf";
cont_type = "vector";
Dir = "PDF_Velocity_increment/";
linewid = 2;
ft_size = 15;
mk_size = 8;
N_pe = length(Pe);
Pe_legend = cell(1,N_pe);
variable1 = ["$r=5$","$r=10$","$r=20$"];
variable2 = "long";
N_variable1 = length(variable1);
N_variable2 = length(variable2);
ind_vari = N_variable1:-2:1;
for i = 1:N_pe
    color_index = gray(4);
    for j = 1:N_variable2
        ind = 3*j-2:3*j;
        figure('Color','w','Visible','on');
        pdf  = load(Dir+"/PDF_Pe"+Pe(i)+".mat").PDF_Pe;
        for k = ind_vari
            if Pe(i) ==10
                semilogy(pdf{end,ind(k)}(:,1),pdf{end,ind(k)}(:,2),symb(i),'Markersize',mk_size,...
                    'linewidth',linewid,'color',color_index(k,:),'markerfacecolor',color_index(k,:)); hold on
            else
                semilogy(pdf{end,ind(k)}(:,1),pdf{end,ind(k)}(:,2),symb(i),'Markersize',mk_size,...
                    'linewidth',linewid,'color',color_index(k,:)); hold on
            end
        end
        ylim([1e-4 1.2]);
        xlim([-5 5]);
        x1 = linspace(-5,5,100); unit_gauss(x1,'r');
        legend(variable1{ind_vari},'interpreter','latex','location','south','fontsize',ft_size);legend box off;
        xlabel('$(s-\langle s\rangle)/\sigma_s$','Interpreter','latex');
        ylabel('PDF','interpreter','latex');
        set(gca,'fontsize',ft_size);
        set(gca,'fontname','times new roman','linewidth',linewid);
        box on
        Video_name_chr = convertStringsToChars( Dir + "/PDF_Pe" + Pe(i)/2 + "_"+variable2(j) + file_type);
        exportgraphics(gcf,Video_name_chr,'ContentType',cont_type);
    end
end