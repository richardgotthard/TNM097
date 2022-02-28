function [difference] = measure_diff(motif, mosaic)

motif_xyz = rgb2xyz(motif);

mosaic_xyz = rgb2xyz(mosaic);


% values for the scielab
whitePoint = [95.05, 100, 108.9];
PPI = 227; % MacBook Air (M1, 2020) 
d = 19; % 5.45 * 3.5 (length of iphone)
SPD = PPI * d * tan(pi / 180);

difference = scielab(SPD, motif_xyz, mosaic_xyz, whitePoint, 'xyz');

difference = mean(difference(:))

end

