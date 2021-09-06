[data1,~,a] = xlsread('Group8-Co1233Raw0.csv');
[data2,~,b] = xlsread('Group8-Co1233Raw1.csv');
[data3,~,c] = xlsread('Group8-Co1233Raw2.csv');

pos1 = data1(:,1);
pos1 = 100.*(pos1./25);
P1 = data1(:,2)/(pi*2.5^2);
pos2 = (data2(:,1));
pos2 = pos2-1.5;
pos2 = 100.*(pos2./25);
P2 = data2(:,2)/(pi*2.5^2);
pos3 = data3(:,1);
pos3 = 100.*(pos3./25);
P3 = data3(:,2)/(pi*4^2);

plot(pos1,P1,'b',pos2,P2,'r',pos3,P3,'g')
hold on

Y = 0;
k1 = 766;
YM1 = [];
for k = k1-20:k1+20
    Y = P1(k)/.002;
    YM1 = [YM1,Y];
end
YM1 = mean(YM1)

k2 = 795;
YM2 = [];
for k = k2-20:k2+20
    Y = P2(k)/.002;
    YM2 = [YM2,Y];
end
YM2 = mean(YM2)

k3 = 741;
YM3 = [];
for k = k3-20:k3+20
    Y = P3(k)/.002;
    YM3 = [YM3,Y];
end
YM3 = mean(YM3)

YS = mean([564.8,555.7,564.5])
plot(.497,YS,'ko','markersize',12)

x1 = linspace(0,.6);
y1 = YM1*x1*.01;
x1 = x1+.2;
plot(x1,y1,'b')

x2 = linspace(0,.6);
y2 = YM2*x2*.01;
x2 = x2+.2;
plot(x2,y2,'g')

x3 = linspace(0,.6);
y3 = YM3*x3*.01;
x3 = x3+.2;
plot(x3,y3,'r')

legend({'Sample 1','Sample 2','Sample 3','Yield Strength'},'fontsize',14)
xlabel('Strain (%)')
ylabel('Stress (MPa)')
title('Tensile Test for Cobalt Alloy 1233')
xlim([0,30])
xticks(0:2:30)
ylim([0,1500])
yticks(0:100:1500)
UTS1 = max(P1)
UTS2 = max(P2)
UTS3 = max(P3)


YM = mean([YM1,YM2,YM3])
UTS = mean([UTS1,UTS2,UTS3])
