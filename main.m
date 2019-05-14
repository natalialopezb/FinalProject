%% Final Project - Natalia Lopez-Barbosa
%close all;
%clear all;
clc;

%Parameters

global rx rpp rpm rs rlu rls rc rjnkp rjnkm ra ri dx dl INi INj ram rcm signal x0 x

Lx = 1820; %Length of XBP1 from https://www.ncbi.nlm.nih.gov/nuccore/NM_005080
Rx = 2400; %[bp/min] Transcription rate in humans from Bionumbers
rx = Rx/Lx; %Transcription rate of XBP1
rpp = 0.15; %[1/min]Phosphorylation rate of IRE1
rpm = 0.05; %[1/min] Dephosphorylation rate of IRE1a
rs = 1/0.8; %[1/min] Splicing rate of XBP1 bionumbers
rlu = (5/606)*60; %[1/min] Translation rate of XBP1u bionumbers
rls = (5/580)*60; %[1/min] Translation rate of XBP1s bionumbers
rc = (4.5/7)/60; %[1/min] Cytokine production rate bionumbers
rjnkp = 0.15; %[1/min] Phosphorylation rate of JNK
rjnkm = 0.05; %[1/min] Dephosphorylation rate of JNKa
ra = 1/22; %[1/min] Estimated from parameters in Bionumbers
ri = 0.001; %[1/min] inhibition rate
dx = log(2)/(10*60); %[1/min] mRNA degradation rate from Bionumbers
dl = 0.08/60; %[1/min] protein degradation rate from bionumbers
INi = 0.5; %[protein/min] Influx of IRE1
INj = 0.15; %[protein/min] Influx of JNK
ram = 0.0001;
rcm = 0.0001;

rpp = rpp*signal/20;
rpm = rpm*signal/20;
INi = INi*signal/50;
INj = INj*signal/50;


%Steady-state: at the kinetic limit

fun = @steady;
x = fsolve(fun,x0);