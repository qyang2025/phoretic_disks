function unit_gauss(~,c)
x1 = linspace(-10,10,1000);
y1 = 1/(sqrt(2*pi))*exp(-0.5*x1.^2);
semilogy(x1,y1,'-','color',c,'linewidth',1.5);
end