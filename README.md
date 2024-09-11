Writer: Hongje Jang
Last Updated: 08/15/2024


How to use
Users must copy the file of Spec_Interpol.m to Matlab folder, and
type "Spec_Interpol(folder_name, init_wn, end_nw)"

folder_name: example ('c:\test')
init_wn: the lowest wavenumber in the spectral region
end_wn: the highest wavenumber in the spectral region

Based on the init_wn and end_wn values, this program automatically
interpolate spectra with interval of 1 cm-1.
  
Goal: This program automatically read multiple files of spectra, and it
changes sampling rate of the data to 1 cm-1 interval.

Result: 
x_data.txt - x_axis information
*_new.txt - resampled spectral intensity files 
