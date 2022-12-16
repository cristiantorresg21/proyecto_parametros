function h=valor(f)
    n=length(f);
    try
        if f(n-2:n)=='Meg' || f(n-2:n)=='meg' || f(n-2:n)=='MEG'  
        h=str2double(f(1:n-1))*(10^(6));
        end
    catch
         if f(n)=='G' || f(n)=='g'
        h=str2double(f(1:n-1))*(10^(9));      
    elseif f(n)=='T' || f(n)=='t'
        h=str2double(f(1:n-1))*(10^(12));  
    elseif f(n)=='k' || f(n)=='K'
        h=str2double(f(1:n-1))*(10^(3)); 
    elseif f(n)=='m' || f(n)=='M'
        h=str2double(f(1:n-1))*(10^(-3));
    elseif f(n)=='µ' || f(n)=='u' || f(n)=='U'
        h=str2double(f(1:n-1))*(10^(-6));
    elseif f(n)=='n' || f(n)=='N'
        h=str2double(f(1:n-1))*(10^(-9));
    elseif f(n)=='p' || f(n)=='P'
        h=str2double(f(1:n-1))*(10^(-12));
    elseif f(n)=='f' || f(n)=='F'
        h=str2double(f(1:n-1))*(10^(-15));
    end
    return;
    end    
    
    if f(n)=='G'
        h=str2double(f(1:n-1))*(10^(9));      
    elseif f(n)=='T'
        h=str2double(f(1:n-1))*(10^(12));  
    elseif f(n)=='k'
        h=str2double(f(1:n-1))*(10^(3)); 
    elseif f(n)=='m'
        h=str2double(f(1:n-1))*(10^(-3));
    elseif f(n)=='µ'
        h=str2double(f(1:n-1))*(10^(-6));
    elseif f(n)=='u'
        h=str2double(f(1:n-1))*(10^(-6));
    elseif f(n)=='n'
        h=str2double(f(1:n-1))*(10^(-9));
    elseif f(n)=='p'
        h=str2double(f(1:n-1))*(10^(-12));
    elseif f(n)=='f'
        h=str2double(f(1:n-1))*(10^(-15));
    end
end
