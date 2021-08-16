function epidemyin2D(n,m)

A = zeros(n);
A(floor(n/2),floor(n/2)) = 1;
colormap jet;
image(40+15*A); axis square; drawnow;

while sum(sum(A))< n^2
    for s=1:m
        i = randi(n,1,2)
        j = sign(rand(1,2)-0.5); l = (rand<0.5);
        k = i+j.*[l, 1-l];
        if min(k)>0 & max(k)<(n+1)
            M = max(A(i(1), i(2)),A(k(1),k(2)));
            A(i(1), i(2)) = M;
            A(k(1),k(2)) = M;
        end
    end
    image(40+15*A); axis square;
    drawnow;
end
end

            