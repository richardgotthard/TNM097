function [RGB_Vec] = motif_based_reduction(motif, nr_colors, tile_size)
% motif_based_reduction() takes in a motif, the number of dominant colors
% you want from a motif and the tile size so that the stack is later sized
% appropriatly to be compared and create a new reduced dataset 

%extract the most prominent colors: (amount is: nr_colors) 
[~, cmap] = rgb2ind(motif, nr_colors);

%create empty array to later apply indices  
temp = zeros(nr_colors, 1);

% Apply indices to array
for i = 1:nr_colors
    temp(i) = i;
end    

% create 'image' to hold the colors using ind2rgb
RGB = ind2rgb(temp, cmap);

% scale and stack the 'image' and return in XYZ format
RGB_Vec = scale_stack_motif_vec(RGB, nr_colors, tile_size);

end

