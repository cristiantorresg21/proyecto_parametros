%this function convert parameters s to parameters t 

function t = to_t(s)

    delta_s = (s(1,1)*s(2,2))-(s(2,1)*s(1,2));
    t = [delta_s,s(11);-s(2,2),1];
    t = (1/s(2,1))*t;

end
