function dE = euclidean_distance_xyz(V1, V2)
    arguments
        V1 (3,20) {mustBeNumeric, mustBeNumeric}
        V2 (3,20) {mustBeNumeric, mustBeNumeric}
    end
    
    [L, a, b] =  xyz2lab(V1(1,:)', V1(2,:)', V1(3,:)');

    V1_LAB = zeros(3,20);
    V1_LAB(1,:) = L;
    V1_LAB(2,:) = a;
    V1_LAB(3,:) = b;

    [L, a, b] =  xyz2lab(V2(1,:)', V2(2,:)', V2(3,:)');

    V2_LAB = zeros(3,20);
    V2_LAB(1,:) = L;
    V2_LAB(2,:) = a;
    V2_LAB(3,:) = b;

    L1 = V1_LAB(1,:);
    L2 = V2_LAB(1,:);

    a1 = V1_LAB(2,:);
    a2 = V2_LAB(2,:);

    b1 = V1_LAB(3,:);
    b2 = V2_LAB(3,:);

    dE = sqrt((L1-L2).^2 + (a1-a2).^2 + (b1-b2).^2);
end