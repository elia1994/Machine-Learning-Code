function X=LoadImage(image)
[X1,map] = imread(image);
if ~isempty(map)
    X = ind2rgb(X1,map);
else
    X=X1;
end