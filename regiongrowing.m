%% resimde bolgesel buyutma yapan program%%

function V = regiongrowing(I,bas,epsilon)
    I = double(I);
    [R,C] = size(I);
    
    x = bas(1);
    y = bas(2);
    
    q{1} = [x,y];
    s{1} = [x,y];
    
    i = 1;
    j = 1;
    k = 1;
    while k <= i
        x = q{k}(1);
        y = q{k}(2);
        k = k + 1;
        if((x < R) && (abs(I(x+1, y) - I(x, y)) <= epsilon))
            if(varmi(q, [x+1, y]) && varmi(s, [x+1, y]))
                i = i + 1;
                q{i} = [x+1, y];
            end
        end
        
        if((x-1 > 0) && (abs(I(x-1, y) - I(x, y)) <= epsilon))
            if( varmi(q, [x-1, y]) && varmi(s, [x-1, y]) )
                i = i + 1;
                q{i} = [x-1, y];
            end
        end
        
        if((y < C) && (abs(I(x, y+1) - I(x, y)) <= epsilon))
            if(varmi(q,[x, y+1]) && varmi(s, [x, y+1]))
                i = i + 1;
                q{i} = [x, y+1];
            end
        end
        
        if((y-1 > 0) && (abs(I(x, y-1) - I(x, y)) <= epsilon))
            if( varmi(q, [x, y-1]) && varmi(s, [x, y-1]) )
                i = i + 1;
                q{i} = [x, y-1];
            end
        end
        
        if(varmi(s,[x, y]))
            j = j + 1;
            s{j} = [x, y];
        end
    end
   
    for r=1:R
        for c=1:C
            I(r,c)=0;
        end
    end
    L = size(s);
    for i = 1:L(2)
        I(s{i}(1),s{i}(2))=150;
    end
    V = I;
    imshow(I);
    ad = input('kaydedilecek resmin adini uzantisi ile giriniz :','s');
    IMWRITE(I,ad);
end
function don = varmi(q, m)
    L  = size(q);
    don = 1;
    
    for i = 1: L(2)
        if (q{i}(1) == m(1) && q{i}(2) == m(2))
            don = 0;
        end
    end
end
        