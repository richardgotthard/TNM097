% TNM097 Project - Ludde Jahrl
% Ludde Jahrl - ludja208, Richard Gotthard - ricgo595
% Load and create two databases with tiles (One resized and the same resized in LAB colorspace)
clc;
clear;

%size of the tiles
tile_size = 30; 

%Change this to choose your motif
motif = 'target/target_4.jpeg'; 

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
% 
% %rows and colomns of the colormap (first reduction)
% color_c = 10; %color sensitivity
% color_r = 10; %hue sensitivity
% 
% %The product of the two color_r & color_c becomes the size of the reduced dataset 
% % NOTE: the product should not exceed the the number in original dataset or
% % it wont serve any purpose
% 
% % function to create reducted dataset:
% % Instead of running the dataset reduction on each run of the program load
% % the next line instead (reduced_xyz_dataset_1 is created w/ tile_size = 16):
% 
% %reduced_xyz_dataset_1 = dataset_reduced(full_xyz_dataset, tile_size, color_c, color_r);
%reduced_xyz_dataset_1 = struct2cell(load('reduced_datasets/reduced_xyz_dataset_1.mat'));
%[dataset1_xyz, dataset1] = index2dataset(reduced_xyz_dataset_1, full_xyz_dataset);
% 
% %rows and colomns of the colormap (second reduction)
% color_c = 7; % color sensitivity
% color_r = 7; % hue sensitivity
% 
% % function to create reducted dataset:
% %reduced_xyz_dataset_2 = dataset_reduced(full_xyz_dataset, tile_size, color_c, color_r);
% reduced_xyz_dataset_2 = struct2cell(load('reduced_datasets/reduced_xyz_dataset_2.mat'));
% [dataset2_xyz, dataset2] = index2dataset(reduced_xyz_dataset_2, full_xyz_dataset);

%% RESIZE THE MOTIF IMAGE

%longest side of the motif in pixels
longest_side = 2000;

motif_scaled = scale_motif(motif_basic, tile_size, longest_side);


%% CREATE REDUCED DATASET FROM MOTIFS DOMINANT COLORS

% %set number of colors in the reduction based on the input; motif:
motif_colors = 25;
% 
% % by calling motif_based_reduction() with the motif, tile size and number
% % of colors, you get as a result back a stacked cell where each cell has a
% % [tile_size * tile_size * 3] matrix representing the most dominant colors of motif 
% % in xyz format
motif_color_stack = motif_based_reduction(motif_scaled, motif_colors, tile_size);
% 
% % reduced_xyz_dataset_landscape holds the new dataset of 25 images
%reduced_xyz_dataset_liberty = stack_compare(full_xyz_dataset, motif_color_stack);
% %reduced_xyz_dataset_3 = struct2cell(load('reduced_datasets/reduced_xyz_dataset_3.mat'));

reduced_xyz_dataset_liberty = struct2cell(load('temp/temp43.mat'));


%reduced_xyz_dataset_landscape = struct2cell(load('reduced_datasets/reduced_xyz_datatset_landscape.mat'));

% works from preloaded datsets, FORMAT: 1x1 cell containing (N x 1 double) indices
[dataset3_xyz, dataset3] = index2dataset(reduced_xyz_dataset_liberty, full_xyz_dataset);



%% STACK THE RESIZED MOTIF IMAGE

[motif_stack, motif_stack_xyz] = stack_img(motif_scaled, tile_size);

%% COMPARE THE STACKS OF THE NEW DATABASES TO THE STACK OF THE MOTIF

%mosaic_1 = stack_compare(dataset1_xyz, motif_stack_xyz);
%mosaic_2 = stack_compare(dataset1_xyz, motif_stack_xyz);
mosaic_3 = stack_compare(dataset3_xyz, motif_stack_xyz);

%% BUILD THE MOSAIC WITH THE RESULT OF THE COMPARISONS

%motif_mosaic_1 = build_mosaic(motif_scaled, dataset1, mosaic_1, tile_size);
%motif_mosaic_2 = build_mosaic(motif_scaled, dataset1, mosaic_2, tile_size);
 motif_mosaic_3 = build_mosaic(motif_scaled, dataset3, mosaic_3, tile_size);
 
%imshow(motif_mosaic_1);
% imshow(motif_mosaic_2);
 imshow(motif_mosaic_3);


%% MEASURE THE PERCIEVED DIFFERENCE OF THE MOSAIC AND THE ORIGINAL MOTIF


% difference_1 = measure_diff(motif_scaled, motif_mosaic_1);
%difference_2 = measure_diff(motif_scaled, motif_mosaic_2);
 difference_3 = measure_diff(motif_scaled, motif_mosaic_3); %0.3210


%    0.3753 girl with earing - 2550x1800 100 img db


