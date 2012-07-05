function sayac = etisayac(I)
uni = unique(I);
saydir = [];

    for i = 1:length(uni)
        t = length(find(I == uni(i)));
        fprintf('"%d" etike degerine sahip %d tane pixel vardir\n',uni(i),t);
        saydir(i,1) = [uni(i)];
        saydir(i,2) = [t];
    end
sayac = saydir;
end
    