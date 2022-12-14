
function [haux]=escalonar(haux,u)
for k=1:1:u
haux(k,:)=haux(k,:)/haux(k,k);
x=u-k;
if x~=0
for i=1:1:x
    haux(i+k,:)=haux(i+k,:)-haux(k,:).*haux(i+k,:);
end
end
end
for k=u:-1:1    
for i=k-1:-1:1
    haux(i,:)=haux(i,:)-haux(k,:).*haux(i,k);    
end
end
end