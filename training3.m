function [W1, W2]=training3()
W1=zeros(7,324);
W2=zeros(7,900);

N=114;
x=zeros(N,60,60,3);
for im=1:N
    x(im,:,:,:)=LoadImage(sprintf('Imm60x60/imm%d.png',im));
end
y2=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X2=zeros(N,324);
for n=1:N
    r1(:,:)=x(n,:,:,1);
    g1(:,:)=x(n,:,:,2);
    b1(:,:)=x(n,:,:,3);
    REig=eigMatrix(dctBlocks(splitImm(r1(:,:),6)));
    GEig=eigMatrix(dctBlocks(splitImm(g1(:,:),6)));
    BEig=eigMatrix(dctBlocks(splitImm(b1(:,:),6)));
    for i=0:5
        for j=0:5
            for k=1:3
                X2(n,k+i*18+j*3)=real(REig(i+1,j+1,k+1));
                X2(n,k+i*18+j*3+108)=real(GEig(i+1,j+1,k+1));
                X2(n,k+i*18+j*3+216)=real(BEig(i+1,j+1,k+1));
            end
        end
    end
end
W1(4,:)=X2'*((X2*X2'+0.01*eye(N))\y2);

N=24;
y=[1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1]';
X=zeros(N,324);
X(:,:)=X2(1:24,:);
W1(1,:)=X'*((X*X'+0.01*eye(N))\y);

X(:,:)=X2(25:48,:);
W1(2,:)=X'*((X*X'+0.01*eye(N))\y);

N=48;
y1=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X1=zeros(N,324);
X1(:,:)=X2(1:48,:);
W1(3,:)=X1'*((X1*X1'+0.01*eye(N))\y1);

N=66;
y3=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X3=zeros(N,324);
X3(:,:)=X2(49:114,:);
W1(5,:)=X3'*((X3*X3'+0.01*eye(N))\y3);

N=34;
y4=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X4=zeros(N,324);
X4(:,:)=X2(49:82,:);
W1(6,:)=X4'*((X4*X4'+0.01*eye(N))\y4);

N=32;
y5=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X5=zeros(N,324);
X5(:,:)=X2(83:114,:);
W1(7,:)=X5'*((X5*X5'+0.01*eye(N))\y5);

N=114;
x=zeros(N,100,100,3);
for im=1:N
    x(im,:,:,:)=LoadImage(sprintf('Imm100x100/imm%d.png',im));
end
y2=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X2=zeros(N,900);
for n=1:N
    r(:,:)=x(n,:,:,1);
    g(:,:)=x(n,:,:,2);
    b(:,:)=x(n,:,:,3);
    REig=eigMatrix(dctBlocks(splitImm(r(:,:),10)));
    GEig=eigMatrix(dctBlocks(splitImm(g(:,:),10)));
    BEig=eigMatrix(dctBlocks(splitImm(b(:,:),10)));
    for i=0:9
        for j=0:9
            for k=1:3
                X2(n,k+i*30+j*3)=real(REig(i+1,j+1,k+1));
                X2(n,k+i*30+j*3+300)=real(GEig(i+1,j+1,k+1));
                X2(n,k+i*30+j*3+600)=real(BEig(i+1,j+1,k+1));
            end
        end
    end
end
W2(4,:)=X2'*((X2*X2'+0.01*eye(N))\y2);

N=24;
y=[1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X=zeros(N,900);
X(:,:)=X2(1:24,:);
W2(1,:)=X'*((X*X'+0.01*eye(N))\y);

X(:,:)=X2(25:48,:);
W2(2,:)=X'*((X*X'+0.01*eye(N))\y);

N=48;
y1=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X1=zeros(N,900);
X1(:,:)=X2(1:48,:);
W2(3,:)=X1'*((X1*X1'+0.01*eye(N))\y1);

N=66;
y3=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X3=zeros(N,900);
X3(:,:)=X2(49:114,:);
W2(5,:)=X3'*((X3*X3'+0.01*eye(N))\y3);

N=34;
y4=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X4=zeros(N,900);
X4(:,:)=X2(49:82,:);
W2(6,:)=X4'*((X4*X4'+0.01*eye(N))\y4);

N=32;
y5=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]';
X5=zeros(N,900);
X5(:,:)=X2(83:114,:);
W2(7,:)=X5'*((X5*X5'+0.01*eye(N))\y5);
