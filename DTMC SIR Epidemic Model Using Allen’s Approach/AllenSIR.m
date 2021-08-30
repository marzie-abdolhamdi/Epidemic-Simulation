% SIR model using Allen's approach
clc, clear all;
N = 100;  % population
G = 0.5;   % Gamma
B = 0.6;   % Beta
delta_t = 0.01;
T = 50;  %t end
I = [];  % number of infectious
S = [];  % number of susceptible
R = [];  % number of recovered
R(1) = 0;
I(1) = 5;
S(1) = N - I(1);
t = 0;
i = 1;
for t = 0:delta_t:T-delta_t

    p1 = ((B*S(i)*I(i))/N)*delta_t;  % probability of new infection
    p2 = G*I(i)*delta_t;  % probability of recovery from infection
    p3 = 1-(p1+p2);  % probability of no change in number of infectious
    u = rand;
    if u <= p1
        S(i+1) = S(i) - 1;
        I(i+1) = I(i) + 1;
        R(i+1) = R(i);
    elseif u > p1 && u <= p1 + p2
        S(i+1) = S(i);
        I(i+1) = I(i) - 1;   
        R(i+1) = R(i) + 1;
    else
        S(i+1) = S(i);
        I(i+1) = I(i); 
        R(i+1) = R(i);
        
    end
    i = i+1;
end

figure 
plot(I,'r')
ylabel('number of infectious');

figure 
plot(S,'g')
ylabel('number of susceptible');

figure 
plot(R,'k')
ylabel('number of recovered');
