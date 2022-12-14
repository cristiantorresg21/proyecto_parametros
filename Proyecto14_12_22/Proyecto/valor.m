function h=valor(f)
    n=length(f);
    if f(n-2:n)=='Meg'
        h=str2double(f(1:n-1))*(10^(6));
    elseif f(n)=='G'
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
