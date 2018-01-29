function blocks = splitImm(image,dim)
    [m,n] = size(image);
    d=floor(m/dim);
    image = uint8(image(1:(dim*d),1:(dim*d)));
    blocks = zeros(d,d,dim,dim);
    for i=1:dim
        for j=1:dim
            for k=(i*d-d+1):(i*d)
                for w=(j*d-d+1):(j*d)
                     blocks((d+k-i*d),(d+w-j*d),i,j)=image(k,w);
                end
            end
        end
    end
end