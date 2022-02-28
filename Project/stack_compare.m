function [VECTOR] = stack_compare(stack_1,stack_2)
% stack_compare takes in two stacks:

% stack_1 should be the entire or partiall dataset
% stack_2 should be the motif/colormap

[stack_2_length,~] = size(stack_2);

[stack_1_length,~] = size(stack_1);

diff = zeros(stack_1_length, 1);

VECTOR = zeros(stack_2_length, 1);

% values for the 
whitePoint = [95.05, 100, 108.9];
PPI = 227; % MacBook Air (M1, 2020) 
d = 19; % 5.45 * 3.5 (length of iphone)
SPD = PPI * d * tan(pi / 180);

    for i = 1:stack_2_length

        for j = 1:stack_1_length
            
            res = scielab(SPD, stack_1{j}, stack_2{i}, whitePoint, 'xyz');
            
            diff(j) = mean(res(:));
        end

        [~, VECTOR(i)] = min(diff); 
        
    end

    
end

