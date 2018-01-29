function y=Classification(name,w,N1)
N2=2*N1;
N3=N1*N1*2;
N4=N3*2;
x=LoadImage(name);
R1=x(:,:,1);
G1=x(:,:,2);
B1=x(:,:,3);
Rblocks= splitImm(R1,N1);
Gblocks= splitImm(G1,N1);
Bblocks= splitImm(B1,N1);
RResult = dctBlocks(Rblocks);
GResult = dctBlocks(Gblocks);
BResult = dctBlocks(Bblocks);
REig1=eigMatrix(RResult);
GEig1=eigMatrix(GResult);
BEig1=eigMatrix(BResult);
Imm=zeros(1,N3*3);
for i=0:N1-1
    for j=0:N1-1
        for k=1:2
            Imm(k+i*N2+j*2)=real(REig1(i+1,j+1,k+1));
            Imm(k+i*N2+j*2+N3)=real(GEig1(i+1,j+1,k+1));
            Imm(k+i*N2+j*2+N4)=real(BEig1(i+1,j+1,k+1));
        end
    end
end
w1=w(7,:)';
w2=w(6,:)';
w3=w(5,:)';
w4=w(4,:)';
w5=w(3,:)';
w6=w(2,:)';
w7=w(1,:)';
v=Imm*Imm'+0.01;
y=Imm'\(v*w4)+1;
if y<1
    y=Imm'\(v*w3)+1;
    if y<1
        y=(Imm'\(v*w1)+1)/2;
    else
        y=(Imm'\(v*w2)+1)/2+2;
    end
else
    y=Imm'\(v*w5)+1;
    if y<1
        y=(Imm'\(v*w6)+1)/2+4;
    else
        y=(Imm'\(v*w7)+1)/2+6;
    end
end
y=y+1;