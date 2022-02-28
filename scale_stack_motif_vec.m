function [stack] = scale_stack_motif_vec(RGB_vec, nr_colors, tile_size)
% resize RGB vec to be have (tile_size) colomns and (tile_size*nr_colors) rows
% and the same amount of channels, 
% RGB_rescaled = imresize(RGB_vec, [tile_size*nr_colors, tile_size], 'bilinear');

% temp = zeros(1);
% temp2 = zeros([tile_size tile_size]);

stack = cell(uint8(nr_colors), 1);


for i = 1:nr_colors
    
    temp = RGB_vec(i, 1, :);
    
    temp2 = imresize(temp, [tile_size tile_size], 'nearest');
    
    stack{i} = rgb2xyz(temp2);
    
    %stack{i} = temp2;
    
end 

end

