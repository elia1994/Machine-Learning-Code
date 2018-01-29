function y=Classification3(name,W10,W20)
N1=20;
w1=W10(7,:)';
w2=W10(6,:)';
w3=W10(5,:)';
w4=W10(4,:)';
w5=W10(3,:)';
w6=W10(2,:)';
w7=W10(1,:)';
W1=W20(7,:)';
W2=W20(6,:)';
W3=W20(5,:)';
W4=W20(4,:)';
W5=W20(3,:)';
W6=W20(2,:)';
W7=W20(1,:)';
x=LoadImage(name);
REig1=real(eigMatrix(dctBlocks(splitImm(x(:,:,1),N1))));
GEig1=real(eigMatrix(dctBlocks(splitImm(x(:,:,2),N1))));
BEig1=real(eigMatrix(dctBlocks(splitImm(x(:,:,3),N1))));
for i=1:2:(N1-5)
    for j=1:2:(N1-5)
        REig=REig1(i:i+5,j:j+5,2:4);
        GEig=GEig1(i:i+5,j:j+5,2:4);
        BEig=BEig1(i:i+5,j:j+5,2:4);
        Imm=(cat(1,REig(:),GEig(:),BEig(:)))';
        v=Imm*Imm'+0.01;
        y=Imm'\(v*w4)+1;
        if y<0.05 && y>-0.05
            y=Imm'\(v*w3)+1;
            if y<1
                y=(Imm'\(v*w1)+1)/2;
            else
                y=(Imm'\(v*w2)+1)/2+2;
            end
            y=y+1;
            return;
        elseif y<2.05 && y>1.95
            y=Imm'\(v*w5)+1;
            if y<1
                y=(Imm'\(v*w6)+1)/2+4;
            else
                y=(Imm'\(v*w7)+1)/2+6;
            end
            y=y+1;
            return;
        end
    end
end
for i=1:2:(N1-9)
    for j=1:2:(N1-9)
        REig=REig1(i:i+9,j:j+9,2:4);
        GEig=GEig1(i:i+9,j:j+9,2:4);
        BEig=BEig1(i:i+9,j:j+9,2:4);
        Imm=(cat(1,REig(:),GEig(:),BEig(:)))';
        v=Imm*Imm'+0.01;
        y=Imm'\(v*W4)+1;
        if y<0.05 && y>-0.05
            y=Imm'\(v*W3)+1;
            if y<1
                y=(Imm'\(v*W1)+1)/2;
            else
                y=(Imm'\(v*W2)+1)/2+2;
            end
            y=y+1;
            return;
        elseif y<2.05 && y>1.95
            y=Imm'\(v*W5)+1;
            if y<1
                y=(Imm'\(v*W6)+1)/2+4;
            else
                y=(Imm'\(v*W7)+1)/2+6;
            end
            y=y+1;
            return;
        end
    end
end
y=0;
end