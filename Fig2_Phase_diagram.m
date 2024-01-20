clc,clear
Dir = "Phase_diagram_RMS_U/";
mkdir(Dir);
L = 50;
ft_size = 14;
linewid = 1.5;
size = 50;
size_l = 120;
shape_s = 'o'; fill_s = 'filled'; 
shape_l = 'p'; fill_l = 'filled';
shape_n = 'o'; fill_n = 'filled';
shape_c = 's'; fill_c = 'filled';
shape_d = 'd'; fill_d = 'filled';
shape_w = '^'; fill_w = 'filled';
shape_ws = '^'; fill_ws = 'filled';
shape_sw = '^'; 
figure('color','w');
x_range = [-0.01 0.51];
y_range = [0.38 7.5];
c_range = [0 0.6];
colo_map = 'hot';
axis_ratio = abs(diff(y_range)/diff(x_range)); dLx = 0.0035;
xlim(x_range);
ylim(y_range);
clim(c_range);
colormap(colo_map);
hold on;
box on; 
xlabel('$\phi$','interpreter','latex');
ylabel('Pe','interpreter','latex');
set(gca,'yticklabel',{'1','2','3','4','5','8','10'},'fontsize',ft_size,'fontname','times new roman','linewidth',linewid);
h_colorbar = colorbar('eastoutside','FontName','times new roman','FontSize',ft_size,'LineWidth',0.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% solid
Pe_s = [1 2 3 4 5 6 7 8 8.5];
vf_s ={
[15 156 324];...                                    %1
[156 324];...                                       %2   
[156 324];...                                       %3
[324 380 484 625 784 961 1122 1260 1444 1599];...   %4
[484 625 784 961 1122 1260 1444];...                %5
[702 784 961 1122 1260 1444];...                    %6
[961 1122 1260 1444];...                            %7
[1122 1260 1444];...                                %8
[1260];...                                          %8.5
};
color_s = {
    [0 0 0];...
    [0 0];...
    [0.002 0];...
    [0.005 0 0 0 0 0 0 0 0 0];...
    [0.005 0.002 0 0.001 0.004 0 0.001];...
    [0.004 0.008 0.004 0.017 0.016 0.012];...
    [0.027 0.021 0.02 0.025];...
    [0.024 0.023 0.035];...
    [0.026];...
    };

for i = 1:length(Pe_s)
    for j = 1: length(vf_s{i})
        x_s = vf_s{i}(j)*pi*0.5^2/L^2; y_s = Pe_s(i)/2; c_s = color_s{i}(j);
        colo_s = retrieve_color_from_colormap(c_range(1),c_range(2),c_s,colo_map);
        hexagon_scatter(x_s,y_s,axis_ratio,dLx,colo_s);
    end
end
%%
x_solid = [15 15 96 256 380 625 776 976 1260 1444 1599 1599 15]*pi*0.5^2/L^2;
err_solid = [1 1.8 2.8 3.8 4.6 5.8 6.8 7.8 8.8 8.5 4.6 1 1]/2;
patch(x_solid,err_solid,'k','facealpha',.1,'linestyle','none');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% liquid&hexatic
x_err = [15 96 256 380 625 776 976 1260 1444 1599]*pi*0.5^2/L^2;
err_neg = [1.8 2.8 3.8 4.6 5.8 6.8 7.8 8.8 8.5 4.6]/2;
err_pos = [2.4 3.4 4.4 5.05 6.2 7.2 8.2 9.2 9.25 9.5]/2;
patch([x_err sort(x_err,'descend')],[err_neg sort(err_pos,'descend')],'r--','edgecolor','none','facealpha',.1);
Pe_l = [2 3 4 5 6 7 8 8.5 8.6 9 9.5];
vf_l = {
    [15];...
    [96];...
    [256];...
    [380 1599];...
    [625 1599];...
    [776 1599];...
    [976 1599];...
    [1599];...
    [1444];
    [1260 1444 1599];...
    [1599];...
    };
color_c = {
    [0.067];...
    [0.07];...
    [0.0402];...
    [0.0873 0.045];...
    [0.0589 0.069];...
    [0.0418 0.102];...
    [0.04 0.2];...
    [0.254];...
    [0.0099];...
    [0.057 0.203 0.298];...
    [0.314];...
    };
for i = 1:length(Pe_l)
    for j = 1: length(vf_l{i})
        scatter(vf_l{i}(j)*pi*0.5^2/L^2,Pe_l(i)/2,size_l,color_c{i}(j),shape_l,fill_l); 
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% scaling curve
vf1 = [15 96 256 380 576 776 976 1260]*pi*0.5^2/L^2;
Pe1_sim = [2 3 4 5 6 7 8 9]/2;
[fitresult, ~, xData, yData] = createFit_scaling(vf1, Pe1_sim);
a=fitresult.a; vf2 = linspace(0.005,0.5,100); Pe2 = a*vf2.^(0.5);
h = plot(vf2,Pe2,'k-','linewidth',2);  h.Color(4) = 0.4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% no chain
Pe_n = 3;
vf_n = 15;
color_n = 0.171;
scatter(vf_n*pi*0.5^2/L^2,Pe_n/2,size,color_n,shape_n,fill_n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  chain
Pe_c = [4 5 6 7 8 9 10 11 12 13 14 15];
N_c = length(Pe_c); vf_c = ones(1,N_c)*15; 
color_c = [0.28 0.264 0.2 0.178 0.161 0.154 0.139 0.13 0.119 0.135 0.104 0.091];
scatter(vf_c*pi*0.5^2/L^2,Pe_c/2,size,color_c,shape_c,fill_c); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  dynamic chain
Pe_d = [4 5 6 7 8 9 10 11 12 13 14 15];
vf_d = {                                     
    [156];...                                                %4   
    [156 324];...                                            %5
    [156 324 380 484];...                                    %6
    [156 324 484 625];...                                    %7
    [156 324 484 625 784];...                                %8 
    [156 324 484 625 784];...                                %9
    [156 324 484 625 784];...                                %10
    [156 324 484 625 784];...                                %11
    [156 324 484 625 784];...                                %16
    [156 324 484 625 784];...                                %18
    [156 324 484 625 784];...                                %20
    [156 324 484 625 784];...                                %40
    };
color_d = {
    [0.33];...
    [0.328 0.366];...
    [0.322 0.362 0.377 0.369];...
    [0.293 0.336 0.359 0.349];...
    [0.283 0.326 0.337 0.349 0.341];...
    [0.276 0.311 0.334 0.339 0.331];...
    [0.261 0.299 0.322 0.332 0.327];...
    [0.253 0.282  0.306 0.31 0.316];...
    [0.196 0.243 0.257 0.264 0.275];...
    [0.186 0.214 0.256 0.251 0.261];...
    [0.186 0.223 0.242 0.249 0.248];...
    [0.138 0.148 0.169 0.178 0.184];...
    };
for i = 1:length(Pe_d)
    for j = 1:length(vf_d{i})
        scatter(vf_d{i}(j)*pi*0.5^2/L^2,Pe_d(i)/2,size,color_d{i}(j),shape_d,fill_d); 
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  wave
Pe_w = [9 9.5 10 11 12 13 14 15];
vf_w = {                                     
    [961 1122];...                                           %9
    [1260 1444];...                                          %9.5
    [961 1122 1260 1444 1599];...                            %10
    [961 1122 1260 1444 1599];...                            %11
    [961 1122];...                                           %16
    [961 1122];...                                           %18
    [961];...                                                %20
    [961];...                                                %40
    };
color_w = {
    [0.322 0.306];...
    [0.29 0.26];...
    [0.329 0.301 0.3 0.267 0.253];...
    [0.307 0.3 0.288 0.273 0.269];...
    [0.266 0.272];...
    [0.263 0.264];...
    [0.254];...
    [0.218];...
    };
for i = 1:length(Pe_w)
    for j = 1: length(vf_w{i})
        scatter(vf_w{i}(j)*pi*0.5^2/L^2,Pe_w(i)/2,size,color_w{i}(j),shape_w,fill_w); 
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  wave&swarm
Pe_ws = [12 13 14];
vf_ws = {                                     
    [1260 1444 1599];...                                     %16
    [1260 1444];...                                          %18
    [1122];...                                               %20
    };
color_ws = {
    [0.239 0.243 0.24];...
    [0.249 0.256];...
    [0.233];...
    };
for i = 1:length(Pe_ws)
    for j = 1: length(vf_ws{i})
        scatter(vf_ws{i}(j)*pi*0.5^2/L^2,Pe_ws(i)/2,size - 20,color_ws{i}(j),shape_ws,'LineWidth',linewid); 
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  wave&swarm
Pe_s = [13 14 15];
vf_s = {
    [1599];...
    [1260 1444 1599];...
    [1122 1260 1444 1599];...
    };
color_s = {
    [0.2487];...
    [0.231 0.226 0.233];...
    [0.1769 0.17 0.172 0.195];...
    };
for i = 1:length(Pe_s)
    for j = 1: length(vf_s{i})
        scatter(vf_s{i}(j)*pi*0.5^2/L^2,Pe_s(i)/2,size-20,color_s{i}(j),shape_sw,'LineWidth',linewid); 
    end
end
Video_name_chr = convertStringsToChars(Dir+"Phase_diagram.pdf");
exportgraphics(gcf,Video_name_chr,'ContentType','vector');
%%
function [fitresult, gof, xData, yData] = createFit_scaling(vf, Pe1_sim)
[xData, yData] = prepareCurveData( vf, Pe1_sim );
ft = fittype( 'a*x^(0.5)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Robust = 'Bisquare';
[fitresult, gof] = fit( xData, yData, ft, opts );
end