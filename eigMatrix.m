function a=eigMatrix(b)
[n,m,x,y]=size(b);
a=zeros(x,y,min(m,n));
for i=1:x
    for j=1:y
        a(i,j,:)=eig(b(:,:,i,j));
    end
end