%%newton metodu ile kok bulan program%%

function V = newtrap(fonk ,turfonk , As , Us, x0, E)
    adim = 1;
    if fonk(As) * fonk(Us) > 0       % aralýk kontrolu yaptýgýmýz yer
        fprintf('uygunsuz aralik');
        exit();
    elseif  turfonk(x0) == 0      
        fprintf "sifira bolme hatasi";
    else
        fprintf('\nNEWTONRAPSON YONTEMÝ:\n------------------\n')
        x1 = x0 - (fonk(x0) / turfonk(x0)); %newtrapda yeni kok degerini elde etme formulu
        while abs(x1 - x0) > E         % durma kosululmuz
            fprintf('X%d = %f\n',adim,x1);
            if turfonk(x0) == 0
                fprintf "sifira bolme hatasi"
            else
            x0 = x1;  % x0 degerini guncelliyoruz
            x1 = x0 - (fonk(x0) / turfonk(x0)); %x1 degerini guncelliyoruz
            end
            adim=adim+1;
        end
        fprintf('X%d = %f\n',adim,x1);
    end
    fprintf('\nkok = %f\nadým sayýsý = %d\n',x1,adim)
    V=x1;
end