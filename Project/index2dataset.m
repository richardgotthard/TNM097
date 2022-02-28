function [reduced_xyz_dataset, reduced_dataset] = index2dataset(index_array, full_xyz_dataset)

temp = index_array{1};

[length, ~] = size(temp);

reduced_dataset = cell(length, 1);

reduced_xyz_dataset = cell(length, 1);

for i = 1:length
    
    reduced_xyz_dataset{i} = full_xyz_dataset{temp(i)};
    
    reduced_dataset{i} = xyz2rgb(full_xyz_dataset{temp(i)});

end


end

