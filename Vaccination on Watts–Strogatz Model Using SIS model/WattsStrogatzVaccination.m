
% vacction on WattsStrogatz models using SIS model
clc, clear all;
n = 501;
K = 25;
beta = 0; %we simulate for 0, 0.15, 0.5, 1
h = WattsStrogatz(n, K, beta);
edge = h.Edges;
E = table2array(edge);
m = length(E);

x = zeros(1,n);
n_male = (n+1)/2; %male population
n_female = n - n_male; %female population
x_male = zeros(1, n_male);
x_female = zeros(1, n_female);
maleInd = randi(n, 1, 2*n_male);
maleInd = sort(maleInd);
maleInd = unique(maleInd);
maleInd = maleInd(1:n_male);
femaleInd = [];

for i = 1:n
    if ismember(i,maleInd)
        %do nothing
    else
        femaleInd(end+1)=i;
    end
end
femaleInd = sort(femaleInd);
femaleInd = unique(femaleInd);
u = randi(n);
x(u) = 1;
if ismember(u,maleInd)
    x_male(find(maleInd==u))=1;
else
    x_female(find(femaleInd==u))=1;
end

t = 0;
T = [];
Tf = [];
Tm = [];
XV = zeros(1,n);
MV = zeros(1, n_male);
FV = zeros(1, n_female);
Tvaccine =[];
TFvaccine=[];
TMvaccine=[];
% inja 
while sum(x)<n
            
    v1 = randi(n);
    v2 = randi(n);
    j = randi(m);
    i1 = E(j,1);
    i2 = E(j,2);
    mi1 = find(maleInd==i1);
    mi2 = find(maleInd==i2);
    fi1 = find(femaleInd==i1);
    fi2 = find(femaleInd==i2);
    if XV(i1)~=1 && XV(i2)~=1
        if ismember(i1,maleInd)
            if ismember(i2,maleInd)
                if rand<0.4
                    x_male(mi1) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));
                end
                if rand<0.4
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                end
            elseif  ismember(i2,femaleInd) 
                if rand<0.4
                     x_male(mi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2)); 
                end
                if rand<0.6
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        elseif ismember(i1,femaleInd)
            if ismember(i2,maleInd) 
                if rand<0.6
                     x_female(fi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));
                end
                if rand<0.4
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  ismember(i2,femaleInd)
                if rand<0.6
                     x_female(fi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));     
                end
                if rand<0.6
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        end
    elseif XV(i1)==1 && XV(i2)~=1
        if ismember(i1,maleInd) 
            if ismember(i2,maleInd) 
                if rand<0.1
                     x_male(mi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));
                end
                if rand<0.4
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  ismember(i2,femaleInd) 
                if rand<0.1
                     x_male(mi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));     
                end
                if rand<0.6
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        elseif ismember(i1,femaleInd) 
            if ismember(i2,maleInd) 
                if rand<0.1
                     x_female(fi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));
                end
                if rand<0.4
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  ismember(i2,femaleInd) 
                if rand<0.1
                     x_female(fi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));     
                end
                if rand<0.6
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        end
    elseif XV(i2)==1 && XV(i1)~=1
        if ismember(i1,maleInd) 
            if ismember(i2,maleInd) 
                if rand<0.4
                     x_male(mi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));
                end
                if rand<0.1
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  ismember(i2,femaleInd)
                if rand<0.4
                     x_male(mi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));     
                end
                if rand<0.1
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        elseif ismember(i1,femaleInd)
            if ismember(i2,maleInd)
                if rand<0.6
                    x_female(fi1) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));
                end
                 if rand<0.1
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  ismember(i2,femaleInd)
                if rand<0.6
                     x_female(fi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));     
                end
                 if rand<0.1
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        end         
    elseif XV(i2)==1 && XV(i1)==1
        if ismember(i1,maleInd)
            if ismember(i2,maleInd)
                if rand<0.1
                     x_male(mi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));
                end
                 if rand<0.1
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  ismember(i2,femaleInd)
                if rand<0.1
                     x_male(mi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));   
                end
                 if rand<0.1
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        elseif ismember(i1,femaleInd)
            if ismember(i2,maleInd)
                if rand<0.1
                    x_female(fi1) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));
                end
                 if rand<0.1
                     x_male(mi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  ismember(i2,femaleInd)
                if rand<0.1
                     x_female(fi1) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));    
                end
                 if rand<0.1
                     x_female(fi2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        end                 
    end 
        
    if ismember(v1,maleInd)
      XV(v1)=1;
      MV(find(maleInd==v1))=1;
    else
      XV(v1)=1;
      FV(find(femaleInd==v1))=1; 
    end
     if ismember(v2,maleInd)
      XV(v2)=1;
      MV(find(maleInd==v2))=1;
    else
      XV(v2)=1;
      FV(find(femaleInd==v2))=1; 
    end   
           
    t = t+1
    T(t) = sum(x);
    Tm(t) = sum(x_male);
    Tf(t) = sum(x_female);
    Tvaccine(t) =sum(XV);
    TFvaccine(t)=sum(FV);
    TMvaccine(t)=sum(MV);
    
end

figure 
plot(T,'r')
ylabel('sum(x)');

figure 
plot(Tf,'r')
ylabel('sum(x_female)');

figure 
plot(Tm,'r')
ylabel('sum(x_male)');

figure 
plot(Tvaccine,'r')
ylabel('sum(vaccine)');

% graph with beta = 0
% plot(h,'NodeColor','k','Layout','circle');
% title('Watts-Strogatz Graph with $N = 501$ nodes, $K = 25$, and $\beta = 0$', ...
%     'Interpreter','latex')

% graph with beta = 0.15
% plot(h,'NodeColor','k','EdgeAlpha',0.1);
% title('Watts-Strogatz Graph with $N = 501$ nodes, $K = 25$, and $\beta = 0.15$', ...
%     'Interpreter','latex')

% graph with beta = 0.5
% plot(h,'NodeColor','k','EdgeAlpha',0.1);
% title('Watts-Strogatz Graph with $N = 501$ nodes, $K = 25$, and $\beta = 0.50$', ...
%     'Interpreter','latex')

% graph with beta = 0.5
% plot(h,'NodeColor','k','EdgeAlpha',0.1);
% title('Watts-Strogatz Graph with $N = 501$ nodes, $K = 25$, and $\beta = 1$', ...
%     'Interpreter','latex')