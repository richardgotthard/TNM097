function dE = euclidean_distance_lab_nxnx3(V1, V2)
%     arguments
%         V1 (512,512,3) {mustBeNumeric, mustBeNumeric}
%         V2 (3,20) {mustBeNumeric, mustBeNumeric}
%     end
    L1 = V1(:,:,1);
    L2 = V2(:,:,1);

    a1 = V1(:,:,2);
    a2 = V2(:,:,2);

    b1 = V1(:,:,3);
    b2 = V2(:,:,3);

    dE = sqrt((L1-L2).^2 + (a1-a2).^2 + (b1-b2).^2);
end