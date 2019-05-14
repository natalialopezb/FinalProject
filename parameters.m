%% Parameters sensitivity
close all;
clear all;
clc;

global rx rpp rpm rs rlu rls rc rjnkp rjnkm ra ri dx dl INi INj ram rcm signal x0 x

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

signal = 0.1;

Par = [1820 2400 0.15 0.05 1.25 0.495 0.5172 0.0107 0.15 0.05 0.0455 0.001 0.0012 0.0013 0.5 0.15 0.0001 0.0001 200 400];
name = ["Length of XBP1","Protein transcription rate","Phosphorylation rate of IRE1","Dephosphorylation rate of IRE1",...
    "Splicing rate of XBP1","Translation rate of XBP1u","Translation rate of XBP1s",...
    "Cytokine production rate","Phosphorylation rate of JNK","Dephosphorylation rate of JNKa",...
    "Apoptosis rate","Inhibition rate","mRNA degradation rate","Protein degradation rate",...
    "Influx of IRE1","Influx of JNK","Apoptosis degradation rate","Cytokine degradation rate",...
    "Initial IRE1", "Initial JNK"];

%Loops are fun
for i=1:20
    %Before changing things
    tempPar = Par(1,i);
    rx = Par(1,2)/Par(1,1); %Transcription rate of XBP1
    rpp = Par(1,3); %[1/min]Phosphorylation rate of IRE1
    rpm = Par(1,4); %[1/min] Dephosphorylation rate of IRE1a
    rs = Par(1,5); %[1/min] Splicing rate of XBP1 bionumbers
    rlu = Par(1,6); %[1/min] Translation rate of XBP1u bionumbers
    rls = Par(1,7); %[1/min] Translation rate of XBP1s bionumbers
    rc = Par(1,8); %[1/min] Cytokine production rate bionumbers
    rjnkp = Par(1,9); %[1/min] Phosphorylation rate of JNK
    rjnkm = Par(1,10); %[1/min] Dephosphorylation rate of JNKa
    ra = Par(1,11); %[1/min] Estimated from parameters in Bionumbers
    ri = Par(1,12); %[1/min] inhibition rate
    dx = Par(1,13); %[1/min] mRNA degradation rate from Bionumbers
    dl = Par(1,14); %[1/min] protein degradation rate from bionumbers
    INi = Par(1,15); %[protein/min] Influx of IRE1
    INj = Par(1,16); %[protein/min] Influx of JNK
    ram = Par(1,17);
    rcm = Par(1,18);

    rpp = rpp*signal/20;
    rpm = rpm*signal/20;
    INi = INi*signal/50;
    INj = INj*signal/50;
    
    x0(1,1) = Par(1,19);
    x0(1,7) = Par(1,20);
    
    fun = @steady;
    y = fsolve(fun,x0);
    
    Par(1,i) = 10*Par(1,i);
    rx = Par(1,2)/Par(1,1); %Transcription rate of XBP1
    rpp = Par(1,3); %[1/min]Phosphorylation rate of IRE1
    rpm = Par(1,4); %[1/min] Dephosphorylation rate of IRE1a
    rs = Par(1,5); %[1/min] Splicing rate of XBP1 bionumbers
    rlu = Par(1,6); %[1/min] Translation rate of XBP1u bionumbers
    rls = Par(1,7); %[1/min] Translation rate of XBP1s bionumbers
    rc = Par(1,8); %[1/min] Cytokine production rate bionumbers
    rjnkp = Par(1,9); %[1/min] Phosphorylation rate of JNK
    rjnkm = Par(1,10); %[1/min] Dephosphorylation rate of JNKa
    ra = Par(1,11); %[1/min] Estimated from parameters in Bionumbers
    ri = Par(1,12); %[1/min] inhibition rate
    dx = Par(1,13); %[1/min] mRNA degradation rate from Bionumbers
    dl = Par(1,14); %[1/min] protein degradation rate from bionumbers
    INi = Par(1,15); %[protein/min] Influx of IRE1
    INj = Par(1,16); %[protein/min] Influx of JNK
    ram = Par(1,17);
    rcm = Par(1,18);

    rpp = rpp*signal/20;
    rpm = rpm*signal/20;
    INi = INi*signal/50;
    INj = INj*signal/50;
    
    x0(1,1) = Par(1,19);
    x0(1,7) = Par(1,20);
    
    fun = @steady;
    z = fsolve(fun,x0);
    
    Par(1,i) = Par(1,i)/100;
    rx = Par(1,2)/Par(1,1); %Transcription rate of XBP1
    rpp = Par(1,3); %[1/min]Phosphorylation rate of IRE1
    rpm = Par(1,4); %[1/min] Dephosphorylation rate of IRE1a
    rs = Par(1,5); %[1/min] Splicing rate of XBP1 bionumbers
    rlu = Par(1,6); %[1/min] Translation rate of XBP1u bionumbers
    rls = Par(1,7); %[1/min] Translation rate of XBP1s bionumbers
    rc = Par(1,8); %[1/min] Cytokine production rate bionumbers
    rjnkp = Par(1,9); %[1/min] Phosphorylation rate of JNK
    rjnkm = Par(1,10); %[1/min] Dephosphorylation rate of JNKa
    ra = Par(1,11); %[1/min] Estimated from parameters in Bionumbers
    ri = Par(1,12); %[1/min] inhibition rate
    dx = Par(1,13); %[1/min] mRNA degradation rate from Bionumbers
    dl = Par(1,14); %[1/min] protein degradation rate from bionumbers
    INi = Par(1,15); %[protein/min] Influx of IRE1
    INj = Par(1,16); %[protein/min] Influx of JNK
    ram = Par(1,17);
    rcm = Par(1,18);

    rpp = rpp*signal/20;
    rpm = rpm*signal/20;
    INi = INi*signal/50;
    INj = INj*signal/50;
    
    x0(1,1) = Par(1,19);
    x0(1,7) = Par(1,20);
    
    fun = @steady;
    w = fsolve(fun,x0);
    
    yla = [y.' z.' w.'];
    Par(1,i) = tempPar;
    
    zla = yla(6,:)./yla(6,1);
    wla(i,:) = zla(1,:).*100;
    
    figure(i)
    xla = categorical({'Original','Increase','Decrease'});
    bar(xla,yla(6,:));
    ylabel('Concentration (nM)','FontWeight','Bold');
    title(name(1,i));
    
end
