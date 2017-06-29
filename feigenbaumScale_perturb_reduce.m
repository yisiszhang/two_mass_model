clear
Q = logspace(-1.3,0,5);
mag = .001;
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
%     y = twomassmodelwithturbulence_convergent_reduce(y0, pars, dt, N, mag);
    y = twomassmodel_tensionperturb_reduce(y0, pars, dt, N, mag);

    % implement Henon's trick to calculate Poincare section
    xp = twomass_reduce_perturb_henon(y(:,lm+1:end),0,pars);    
    plot(log10(ones(1,size(xp,2))*Q(i)),xp(1,:),'r.')
%     x{i} = xp;
end

