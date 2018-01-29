N=8;  % N tale che divida 200.
w=training(N);

y1(56)=Classification('Closed7.png',w,N);
y1(55)=Classification('Closed6.png',w,N);
y1(54)=Classification('Closed5.png',w,N);
y1(53)=Classification('Closed4.png',w,N);
y1(52)=Classification('Closed3.png',w,N);
y1(51)=Classification('Closed2.png',w,N);
y1(50)=Classification('Closed1.png',w,N);
y1(49)=Classification('Confine1.png',w,N);
y1(48)=Classification('Confine2.png',w,N);
y1(47)=Classification('Confine3.png',w,N);
y1(46)=Classification('Confine4.png',w,N);
y1(45)=Classification('Confine5.png',w,N);
y1(44)=Classification('Confine6.png',w,N);
y1(43)=Classification('Confine7.png',w,N);
y1(42)=Classification('Park7.png',w,N);
y1(41)=Classification('Park6.png',w,N);
y1(40)=Classification('Park5.png',w,N);
y1(39)=Classification('Park4.png',w,N);
y1(38)=Classification('Park3.png',w,N);
y1(37)=Classification('Park2.png',w,N);
y1(36)=Classification('Park1.png',w,N);
y1(35)=Classification('Pedone1.png',w,N);
y1(34)=Classification('Pedone2.png',w,N);
y1(33)=Classification('Pedone3.png',w,N);
y1(32)=Classification('Pedone4.png',w,N);
y1(31)=Classification('Pedone5.png',w,N);
y1(30)=Classification('Pedone6.png',w,N);
y1(29)=Classification('Pedone7.png',w,N);
y1(28)=Classification('Divieto7.png',w,N);
y1(27)=Classification('Divieto6.png',w,N);
y1(26)=Classification('Divieto5.png',w,N);
y1(25)=Classification('Divieto4.png',w,N);
y1(24)=Classification('Divieto3.png',w,N);
y1(23)=Classification('Divieto2.png',w,N);
y1(22)=Classification('Divieto1.png',w,N);
y1(21)=Classification('Stop7.png',w,N);
y1(20)=Classification('Stop6.png',w,N);
y1(19)=Classification('Stop5.png',w,N);
y1(18)=Classification('Stop4.png',w,N);
y1(17)=Classification('Stop3.png',w,N);
y1(16)=Classification('Stop2.png',w,N);
y1(15)=Classification('Stop1.png',w,N);
y1(14)=Classification('Veloc7.png',w,N);
y1(13)=Classification('Veloc6.png',w,N);
y1(12)=Classification('Veloc5.png',w,N);
y1(11)=Classification('Veloc4.png',w,N);
y1(10)=Classification('Veloc3.png',w,N);
y1(9)=Classification('Veloc2.png',w,N);
y1(8)=Classification('Veloc1.png',w,N);
y1(7)=Classification('Transito7.png',w,N);
y1(6)=Classification('Transito6.png',w,N);
y1(5)=Classification('Transito5.png',w,N);
y1(4)=Classification('Transito4.png',w,N);
y1(3)=Classification('Transito3.png',w,N);
y1(2)=Classification('Transito2.png',w,N);
y1(1)=Classification('Transito1.png',w,N);

y1=int8(y1);

for i=1:56
    if y1(57-i)==1
        y(:,:,57-i)=char('Attraversamento');
    elseif y1(57-i)==2
        y(:,:,57-i)=char('Parcheggio     ');
    elseif y1(57-i)==3
        y(:,:,57-i)=char('Confine statale');
    elseif y1(57-i)==4
        y(:,:,57-i)=char('Strada chiusa  ');
    elseif y1(57-i)==5
        y(:,:,57-i)=char('Limite velocità');
    elseif y1(57-i)==6
        y(:,:,57-i)=char('Transito       ');
    elseif y1(57-i)==7
        y(:,:,57-i)=char('Senso vietato  ');
    elseif y1(57-i)==8
        y(:,:,57-i)=char('Stop           ');
    else
        y(:,:,57-i)=char('----           ');
    end
end
close all;
for i=1:28
    text(0.7,i/29,y(:,:,i));
end
for i=29:56
    text(0.2,(i-28)/29,y(:,:,i));
end
for i=1:28
    if(i<10)
        text(0.67,i/29,char(i+48));
    elseif(i<20)
        text(0.66,i/29,char('1'));
        text(0.67,i/29,char(i+38));
    else
        text(0.66,i/29,char('2'));
        text(0.67,i/29,char(i+28));
    end
end
for i=1:28
    if(i<2)
        text(0.16,i/29,char('2'));
        text(0.17,i/29,char(i+56));
    elseif(i<12)
        text(0.16,i/29,char('3'));
        text(0.17,i/29,char(i+46));
    elseif(i<22)
        text(0.16,i/29,char('4'));
        text(0.17,i/29,char(i+36));
    else
        text(0.16,i/29,char('5'));
        text(0.17,i/29,char(i+26));
    end
end
