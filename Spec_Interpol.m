function Spec_Interpol(folder_name, init_wn, end_wn)

% Writer: Hongje Jang
% Last Updated: 08/15/2024
% How to use
%   Users must copy the file of Spec_Interpol.m to Matlab folder, and
%   type Spec_Interpol(folder_name, init_wn, end_nw)
%   folder_name: example ('c:\test')
%   init_wn: the lowest wavenumber in the spectral region
%   end_wn: the highest wavenumber in the spectral region
%   Based on the init_wn and end_wn values, this program automatically
%   interpolate spectra with interval of 1 cm-1.
%   
% Goal: This program automatically read multiple files of spectra, and it
% changes sampling rate of the data to 1 cm-1 interval.
%
% Result: 
% x_data.txt - x_axis information
% *_new.txt - resampled spectral intensity files 



files = dir(folder_name);


x_data = [init_wn:1:end_wn];


for i = 3:size(files, 1)
    
    spec_init(:, :) = table2array(readtable([folder_name '\' files(i).name]));
    
    spec_raw(i-2, :, 1) = x_data;
    spec_raw(i-2, :, 2) = interp1(spec_init(:, 1), spec_init(:, 2), x_data);

    temp_raw = zeros(size(spec_raw, 2), 1);
    temp_raw = spec_raw(i-2, :, 2);

    csvwrite([folder_name '\' files(i).name '_new.txt'], temp_raw');

    clear spec_init, temp_raw
    
end



csvwrite([folder_name '\x_data.txt'], x_data');


