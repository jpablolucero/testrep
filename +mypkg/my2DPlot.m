classdef my2DPlot < handle
    properties
        p
    end
    methods
        function self = my2DPlot(f,a,b)
            x = linspace(a,b,100);
            y = f(x);
            self.p = [plot(x,y)];
        end
        function [] = labels(self,x,y)
            xlabel(x);
            ylabel(y);
        end
        function [] = addPlot(self,f,a,b)
            hold on
            x = self.p.XData;
            y = f(x);
            self.p = [self.p,plot(x,y)];
            hold off
        end
        function [] = dotted(self)
            self.p(end).LineStyle = 'none';
            self.p(end).Marker = '.';
        end
        function [] = color(self,colorName)
            self.p(end).Color = colorName ;
        end
        function [] = logy(self)
            set(gca,'YScale','log');
        end
        function [] = logx(self)
            set(gca,'XScale','log');
        end
        function [] = save(self,fileName)
            saveas(gcf,fileName);
        end
    end
end