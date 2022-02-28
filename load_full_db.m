function [full_dataset,full_xyz_dataset] = load_full_db(folder, tile_size)
% load_full_db (dataset{} & xyz_dataset{})
% function that loads the datbase folder and stores it in 2 datsets
% First is the datset resized using bicubic interpolation to tile_size
% Second dataset is the same only its in the xyz colorspace

file_names = dir(fullfile(folder, '*.jpg'));
file_names = {file_names.name}'; 

ds_length = length(file_names); %number of images in entire database

full_dataset = cell(ds_length, 1); % {1, db_length, [tile_size tile_size]}

full_xyz_dataset = cell(ds_length, 1); %xyz image dataset used to compare images to colors later

    for i=1:ds_length
        fname = fullfile(folder, file_names{i});
        img = imread(fname);

        %resize image 
        img = imresize(img, [tile_size tile_size], 'bicubic');

        %Create dataset for resized images
        full_dataset{i} = im2double(img); 

        %convert resized images to LAB
        xyzImg = rgb2xyz(im2double(full_dataset{i})); %

        % - And store in seperate datset
        full_xyz_dataset{i} = xyzImg; 

    end

end

