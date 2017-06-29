clear
Q = logspace(0,1.5,5);

% initial conditions
y0 = [  .1; 0;
        .1; 0];
    
dt = 0.001;
N = 1000/dt;
% x = [];
lm = N/2;
npar = length(Q);

figure
hold on
for i = 1:npar
    pars = setscalepar_reduce(Q(i));
    y = soltwomassmodel_reduce(y0, pars, dt, N);

    % implement Henon's trick to calculate Poincare section
    xp = twomass_reduce_henon(y(:,lm+1:end),0,pars);    
    plot(log10(ones(1,size(xp,2))*Q(i)),xp(1,:),'r.')
%     x{i} = xp;
end

