%%matlabdaki bwlabel fonksiyonun yaptýgý isi yapan program %%

function I=etiket(I)
    [R,C] = size(I);
    I = double(imfill( (im2bw(I)), 'holes' ));
    etiket = 2;
    
    for x = 1:R
        for y = 1:C
            if (x == 1 && y == 1 && I(x,y) == 1)
                I(x,y) = etiket;
                etiket = etiket+1;
                
            elseif (y == 1 && I(x,y) == 1)
                  if (I(x-1,y) > 1)
                     I(x,y) = I(x-1,y);
                     
                  else 
                    I(x,y) = etiket;
                    etiket = etiket+1;
                  end
                  
            elseif (x == 1 && I(x,y) == 1)  
                   if (I(x,y-1) > 1)
                       I(x,y) = I(x,y-1);
                       
                   else 
                       I(x,y) = etiket;
                       etiket = etiket+1;
                       
                   end
                   
            else 
                  if (I(x,y) == 1)
                      if (I(x-1,y) > 1 && I(x,y-1) > 1)
                          
                            if (I(x,y-1) >= I(x-1,y))
                                I(x,y) = I(x-1,y);
                                I(I == I(x,y-1)) = I(x-1,y);
                                
                            else
                                I(x,y) = I(x,y-1);
                                I(I == I(x-1,y)) = I(x,y-1);
                                
                            end
                            
                      elseif (I(x-1,y) > 1)
                              I(x,y) = I(x-1,y);
                              
                      elseif (I(x,y-1) > 1) 
                              I(x,y) = I(x,y-1);
                              
                      else 
                          I(x,y) = etiket;
                          etiket = etiket+1;
                         
                      end
                      
                  end
            end
        end
    end
    
    neigh = I(I ~= 0);
        etiketler = unique(neigh);

        for i = 1:length(etiketler)
            I(I == etiketler(i)) = i;
        end
        imshow(I)
        ad = input('kaydedilecek resmin adini uzantisi ile giriniz :','s');
        IMWRITE(I,ad);
end
