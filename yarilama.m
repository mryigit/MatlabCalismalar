%% yar�lama(bisection metodu ile kok bulan program)

function V = yarilama(fonk,As,Us,E)
    adim = 1;
    As
    if fonk(As) * fonk(Us) > 0       % aralik uyumlulugu kontrol ettigimiz kisim
        fprintf('uygunsuz aralik');
        exit();
    
    else
        fprintf('\nYARILAMA Y�NTEM�:\n------------------\n')
        %%
        while abs(As - Us) > E  % bizden istenen hassasiyet saglanana kadar ayni islemler devam eder
            ort = (As + Us) / 2;     % verilen araligin ortalamasini alarak koke yaklasmay� deniyoruz
            fprintf('X%d = %f\n',adim,ort);
            %% bize verilen alt snir ve ust siniri kullanarak elde ettimiz
            %ortalama degerin yeni alt s�n�rm� yoksa yeni ust s�n�rm�
            %olduguna  program�n kara verdigi k�s�m
            if fonk(As) * fonk(ort) < 0 % eger alt s�n�r�n denklemdeki islemi sonucuyla 
                Us = ort;               %ortalaman�n denklemdeki sonucu carp�m� 0 dan kucukse
                                   % Ust s�n�r olarak ortalamay� al�yorzu
                 
            elseif fonk(Us) * fonk(ort) < 0 %eger ortalama ile ust sinir denklem sonucu carpimi
                As = ort;               % 0 dan kucuk se al sinir degerini guncelliyoruz
            end
            
            adim = adim + 1;
       
        end
    end
    fprintf('\nkok = %f\nad�m say�s� = %d\n',ort,adim-1)
    V=ort;
end
            
            
