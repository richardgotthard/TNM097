
function [mosaic] = build_mosaic(motif, dataset, tile_vec, tile_size)
% build_mosaic takes in the resized motif (motif), 

%empty matrix that will store the complete mosaic image
mosaic = [];

% actual tiles that will build the mosaic 
% dataset_resized;

[w,h,~] = size(motif);

%index represents which image in 
%index = 1;

%num_of_tiles = length(tile_vec);

index = 1;

    for i = 1:tile_size:w %change for correct h/w
        for j = 1:tile_size:h

                 tile_x = i:i+tile_size-1;
                 tile_y = j:j+tile_size-1;

                 current_tile = im2double(dataset{tile_vec(index)});

                 mosaic(tile_x, tile_y, :) = current_tile;

            index = index + 1;
        end
    end
    
end