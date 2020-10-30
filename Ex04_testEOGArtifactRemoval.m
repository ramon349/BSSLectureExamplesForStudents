% Removing EOG artifacts from EEG signals
%
% BMI500 Course
% Lecture:  An Introduction to Blind Source Separation and Independent Component Analysis
%           By: R. Sameni
%           Department of Biomedical Informatics, Emory University, Atlanta, GA, USA
%           Fall 2020
%
% Dependency: The open-source electrophysiological toolbox (OSET):
%       https://github.com/alphanumericslab/OSET.git
%   OR
%       https://gitlab.com/rsameni/OSET.git
%

clc
clear
close all

example = 1;
switch example
    case 1 % A sample EEG from the OSET package
        load EEGdata textdata data % Load a sample EEG signal
        fs = 250;
        x = data'; % make the data in (channels x samples) format
        % Check the channel names
        disp(textdata)
    otherwise
        error('unknown example');
end

N = size(x, 1); % The number of channels
T = size(x, 2); % The number of samples per channel
t = (0 : T - 1)/fs;

approach = 'symm'; 
g = 'tanh'; 
lastEigfastica = N; 
numOfIC= N; 
interactivePA = ' off'; 
[ s_fastica, A_fatsica] = fastica(x,'approach',approach,'g',g,'lastEig',lastEigfastica,'numOfIC',numOfIC,'interactivePCA','off')
Cs = cov(s_fastica'); 
lastEigJADE = N; 
W_JADE = jadeR(x,lastEigJade); 
s_jade = W_JADE * x; 
lastEigSOBI = N; 
num_cov_matrices = 100; 
[W_SOBI,s_sobi] = sobi(x,lastEigSOBI,num_cov_matrices); 
PlotECG(s_fastica,4,'r',fs,' Sources extracted by fatsica')

