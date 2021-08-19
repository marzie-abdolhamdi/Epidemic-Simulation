%% initialization
n = 15*15;
E1 = randomgraph(n, 2*sqrt(n)*(sqrt(n)-1));
E2 = LatticeGraph(sqrt(n));
E3 = complteGraph(n);
%% group vaccination
vacgroup_random = 0;
vacgroup_lattice = 0;
vacgroup_complete = 0;
iter = 10;
for i = 1:iter
    
    vacgroup_random = vacgroup_random + vacgroup(n, E1);
    vacgroup_lattice = vacgroup_lattice + vacgroup(n, E2);
    vacgroup_complete = vacgroup_complete + vacgroup(n, E3);
end
T_vacgroup_random = vacgroup_random/iter;
T_vacgroup_lattice = vacgroup_lattice/iter;
T_vacgroup_complete = vacgroup_complete/iter;
%% random vaccination 
vacrandom_random = 0;
vacrandom_lattice = 0;
vacrandom_complete = 0;
iter = 10;
for i = 1:iter
    
    vacrandom_random = vacrandom_random + vacrandom(n, E1);
    vacrandom_lattice = vacrandom_lattice + vacrandom(n, E2);
    vacrandom_complete = vacrandom_complete + vacrandom(n, E3);
end
T_vacrandom_random = vacrandom_random/iter;
T_vacrandom_lattice = vacrandom_lattice/iter;
T_vacrandom_complete = vacrandom_complete/iter;

