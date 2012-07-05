%% etiketlenmis resimdeki lekelerden kurtulan program matlabldaki imfill fonksyionun yaptýgý
%% isi yapar

function silici = bimfill(I,seps)
s=etisayac(I);
t=size(s);

    for i = 1:t(1)
        if(s(i,2) < seps)
        I(find(I == s(i,1))) = 0;
        end
    end

silici = I;
h=not(I);
imshow(h);
ad = input('kaydedilecek resmin adini uzantisi ile giriniz :','s');
    IMWRITE(h,ad);
end