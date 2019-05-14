%% Building conditions
close all;
clear all;
clc;

global signal x0 x

signal = 0.05; %Signaling ER stress

%Initial conditions

x0 = zeros(1,10);
x0(1,1) = 200; %IRE1
x0(1,2) = 0; %IRE1a
x0(1,3) = 0; %mXBP1
x0(1,4) = 0; %mXBP1s
x0(1,5) = 0; %XBP1u
x0(1,6) = 0; %XBP1s
x0(1,7) = 400; %JNK
x0(1,8) = 0; %JNKa
x0(1,9) = 0; %Cytokines
x0(1,10) = 0; %Apoptotic signal
main;
y(:,1) = x.';

j=2;
for i=0.1:0.05:0.15
    signal = i;
    x0(1,1) = 180+(i*(1.2-i));
    main;
    y(:,j) = x.';
    j = j+1;
end

z = y(:,:)./y(:,1);
z = z.*100;

%% Raw Figures
figure(1)
%xla = categorical({'IRE1','IRE1a','mXBP1','mXBP1s','XBP1u','XBP1s','JNK','JNKa','Cytokines','Apoptosis'});
xla = categorical({'IRE1 0%','IRE1 10%','IRE1 100%'});
xla = reordercats(xla,{'IRE1 0%','IRE1 10%','IRE1 100%'});
bar(xla,y(1,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([90 380])

figure(2)
xla = categorical({'IRE1a 0%','IRE1a 10%','IRE1a 100%'});
xla = reordercats(xla,{'IRE1a 0%','IRE1a 10%','IRE1a 100%'});
bar(xla,y(2,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([0 285])

figure(3)
xla = categorical({'mXBP1 0%','mXBP1 10%','mXBP1 100%'});
xla = reordercats(xla,{'mXBP1 0%','mXBP1 10%','mXBP1 100%'});
bar(xla,y(3,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([0 300])

figure(4)
xla = categorical({'mXBP1s 0%','mXBP1s 10%','mXBP1s 100%'});
xla = reordercats(xla,{'mXBP1s 0%','mXBP1s 10%','mXBP1s 100%'});
bar(xla,y(4,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([316000 321000])

figure(5)
xla = categorical({'XBP1u 0%','XBP1u 10%','XBP1u 100%'});
xla = reordercats(xla,{'XBP1u 0%','XBP1u 10%','XBP1u 100%'});
bar(xla,y(5,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([108000 110100])

figure(6)
xla = categorical({'XBP1s 0%','XBP1s 10%','XBP1s 100%'});
xla = reordercats(xla,{'XBP1s 0%','XBP1s 10%','XBP1s 100%'});
bar(xla,y(6,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([122000000 124500000])

figure(7)
xla = categorical({'JNK 0%','JNK 10%','JNK 100%'});
xla = reordercats(xla,{'JNK 0%','JNK 10%','JNK 100%'});
bar(xla,y(7,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([0 115])

figure(8)
xla = categorical({'JNKa 0%','JNKa 10%','JNKa 100%'});
xla = reordercats(xla,{'JNKa 0%','JNKa 10%','JNKa 100%'});
bar(xla,y(8,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([112.36 112.365])

figure(9)
xla = categorical({'Cytokines 0%','Cytokines 10%','Cytokines 100%'});
xla = reordercats(xla,{'Cytokines 0%','Cytokines 10%','Cytokines 100%'});
bar(xla,y(9,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([13150000000 13330000000])

figure(10)
xla = categorical({'Apoptosis 0%','Apoptosis 10%','Apoptosis 100%'});
xla = reordercats(xla,{'Apoptosis 0%','Apoptosis 10%','Apoptosis 100%'});
bar(xla,y(10,:))
ylabel('Concentration (nM)','FontWeight','Bold');
% ylim([51073.2 51074.3])

%% Percentage Figures

figure(11)
xla = categorical({'XBP1s 0%','XBP1s 10%','XBP1s 100%'});
xla = reordercats(xla,{'XBP1s 0%','XBP1s 10%','XBP1s 100%'});
bar(xla,z(1,:))
ylabel('Percentage of Expression','FontWeight','Bold');