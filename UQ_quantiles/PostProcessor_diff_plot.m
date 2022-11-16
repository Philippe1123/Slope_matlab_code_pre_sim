function [  ] = PostProcessor_diff_plot(  )
%POSTPROCESSOR Summary of this function goes here
%   Detailed explanation goes here
% close all
clear all
clc


basename = 'Slope MLMC_Het_High_23-11-2020-T:14:04:37';
read_samples = @(level, qoi) dlmread(strcat(basename, '/Samples/', ...
    num2str(qoi), '_1/samples_level_', num2str(level), '.txt'));

nqoi = 100;
nlevel = 3;

% preallocate samples
samples = cell(1, nlevel);
for level = 1:nlevel
    s = read_samples(level-1, 1);
    samples{level} = zeros(length(s), nqoi);
    for qoi = 1:nqoi
        samples{level}(:, qoi) = read_samples(level-1, qoi);
    end
end

%% jitter!

ntries = 10000;
shuffled_samples = zeros(ntries, nqoi);
for level = 1:nlevel
    myperm = randi(size(samples{level}, 1), size(shuffled_samples, 1), 1);
    shuffled_samples = shuffled_samples + abs(samples{level}(myperm, :));
end

step=13.5/99;

x_in=0.01:0.01:1;


pdf=shuffled_samples';
pdf=pdf*1000;
pdf=pdf(1:nqoi,:);


Foldername='test';
%x_in=x_in(2:end-1);

%pdf=pdf(2:end-1,:);
figure
pdfVisualisation_diff_plot(x_in,  pdf,-1,Foldername);
axis([0 1.0 0 100 ]);
xlabel('\% of the slope own weight');
ylabel('Absolute value of the Deflection [mm]');
xticks([[0:0.1:1] 13.5]);
hold on
x1=[55 67];
y1=[0.93 0.93];

x2=[55 67];
y2=[1 1];

x3=[55 55];
y3=[0.93 1];

x4=[67 67];
y4=[0.93 1];

plot(y1,x1,'-k');
plot(y2,x2,'-k');
plot(y3,x3,'-k');
plot(y4,x4,'-k');

linkx=[0.93 0.45];
linky=[55 36];
plot(linkx,linky,'-k')

linkx=[0.93 0.44];
linky=[67 87];
plot(linkx,linky,'-k')


axes('position',[.4 .225 .4 .25])

box on
index=(x_in>=0.93)&(x_in<=1);
hold on
pdfVisualisation_diff_plot(x_in(index),  abs(pdf(index,:)),-1,Foldername);
hold on
 
axis([ 0.93 1.001 55 67 ]);
xticks([0.94:0.02:1.])
yticks([55:1:67])


%Plot2LaTeX(figure(1), 'Uncert')


end

