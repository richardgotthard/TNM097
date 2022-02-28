function [stack, stack_xyz] = stack_img(image, tile_size)
% function stack_img takes in an image and segments it row by row into a
% stack by the size (tile_size). The image needs to be sized correctly as
% to be made of a height and width evenly divisible by the tile size.

[h, w, ~] = size(image); 

length = ((h/tile_size) * (w/tile_size));

stack = cell(length, 1);

stack_xyz = cell(length, 1);

%stack = cell(uint8(length), 1);

index = 1;

    for i = 1:tile_size:h
        for j = 1:tile_size:w

             tile_x = j:j+tile_size-1;
             tile_y = i:i+tile_size-1;

             stack{index} =  image(tile_y,tile_x,:);
             
             stack_xyz{index} =  rgb2xyz(image(tile_y,tile_x,:));  

             index = index + 1;
        end  
    end 

end

