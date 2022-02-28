function [scaled_motif] = scale_motif(motif, tile_size, longest_side)
% scale_img takes a motif (that will be later comprised of tiles) 
% and scales it to an appropriate size such that the dimensions of the
% motif lines up with the tile size. -> Width & height of motif must be
% evenly divisible with the tile size (height/width)

[h, w, ~] = size(motif);

ratio = h/w;

% Scaling based on the screen dimensions of Apple's MacBook Air (M1, 2020 ed.)
% 2560 x 1600. By dividing the screen dimesnion by the tile size and then
% rounding it to the nearest number and then multiplying by the tile size 
% again it is ensured that the motif is evenly divisible by the tile size.

%scaled_motif = imresize(motif,[(round(2560/tile_size)*tile_size),round((2560/ratio)/tile_size)*tile_size],'bicubic');
scaled_motif = imresize(motif,[(round(longest_side/tile_size)*tile_size),round((longest_side/ratio)/tile_size)*tile_size],'bicubic');


end