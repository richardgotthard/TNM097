% TNM097 Project - Ludde Jahrl
% Ludde Jahrl - ludja208, Richard Gotthard - ricgo595
% Load and create two databases with tiles (One resized and the same resized in LAB colorspace)
clc;
clear;

%size of the tiles
tile_size = 25; 

%Change this to choose your motif
motif = 'target/target_1.jpeg'; 

%load motif
motif_basic = imread(motif); 

%string of the folder holding the images in (.jpg) format
folder = './database/'; 

%% LOAD DATASET (dataset{} & xyz_dataset{}) 342 TILES
% function that loads the full datbase folder and stores it in 2 datsets
% First is the datset resized using bicubic interpolation to tile_size
% Second dataset is the same only its in the xyz colorspace

[full_dataset, full_xyz_dataset] = load_full_db(folder, tile_size); %db0

%% CREATE REDUCED DATASET FROM COLORMAP 

%rows and colomns of the colormap (first reduction)
color_c = 10; %color sensitivity
color_r = 10; %hue sensitivity

%The product of the two color_r & color_c becomes the size of the reduced dataset 
% NOTE: the product should not exceed the the number in original dataset or
% it wont serve any purpose

% function to create reducted dataset:
% Instead of running the dataset reduction on each run of the program load
% the next line instead (reduced_xyz_dataset_1 is created w/ tile_size = 16):

reduced_xyz_dataset = dataset_reduced(full_xyz_dataset, tile_size, color_c, color_r);

%% RESIZE THE MOTIF IMAGE

motif_scaled = scale_motif(motif_basic, tile_size);

%% STACK THE RESIZED MOTIF IMAGE

[motif_stack, motif_stack_xyz] = stack_img(motif_scaled, tile_size);

%% COMPARE THE STACKS OF THE NEW DATABASES TO THE STACK OF THE MOTIF

mosaic = stack_compare(reduced_xyz_dataset, motif_stack_xyz);

%% BUILD THE MOSAIC WITH THE RESULT OF THE COMPARISONS

motif_mosaic = build_mosaic(motif_scaled, dataset1, mosaic, tile_size);
 
imshow(motif_mosaic);

%% MEASURE THE PERCIEVED DIFFERENCE OF THE MOSAIC AND THE ORIGINAL MOTIF

difference = measure_diff(motif_scaled, motif_mosaic);





