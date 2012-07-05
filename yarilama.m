%% yarýlama(bisection metodu ile kok bulan program)

function V = yarilama(fonk,As,Us,E)
    adim = 1;
    As
    if fonk(As) * fonk(Us) > 0       % aralik uyumlulugu kontrol ettigimiz kisim
        fprintf('uygunsuz aralik');
        exit();
    
    else
        fprintf('\nYARILAMA YÖNTEMÝ:\n------------------\n')
        %%
        while abs(As - Us) > E  % bizden istenen hassasiyet saglanana kadar ayni islemler devam eder
            ort = (As + Us) / 2;     % verilen araligin ortalamasini alarak koke yaklasmayý deniyoruz
            fprintf('X%d = %f\n',adim,ort);
            %% bize verilen alt snir ve ust siniri kullanarak elde ettimiz
            %ortalama degerin yeni alt sýnýrmý yoksa yeni ust sýnýrmý
            %olduguna  programýn kara verdigi kýsým
            if fonk(As) * fonk(ort) < 0 % eger alt sýnýrýn denklemdeki islemi sonucuyla 
                Us = ort;               %ortalamanýn denklemdeki sonucu carpýmý 0 dan kucukse
                                   % Ust sýnýr olarak ortalamayý alýyorzu
                 
            elseif fonk(Us) * fonk(ort) < 0 %eger ortalama ile ust sinir denklem sonucu carpimi
                As = ort;               % 0 dan kucuk se al sinir degerini guncelliyoruz
            end
            
            adim = adim + 1;
       
        end
    end
    fprintf('\nkok = %f\nadým sayýsý = %d\n',ort,adim-1)
    V=ort;
end
            
            
