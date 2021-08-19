function E = complteGraph(n);

E = zeros(n*(n-1)/2,2);
t = 1;
for i = 1:(n-1)
    for j = (i+1):n
        E(t,:) = [i,j];
        t = t+1;
    end
end