function out = map_feature(feat1, feat2)
    degree = 6;
    out = ones(size(feat1(:,1)));
    for i = 1:degree
        for j = 0:i
            out(:, end+1) = (feat1.^(i-j)).*(feat2.^j);
        end
    end
    