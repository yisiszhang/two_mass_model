clear
Ps = 0.002:0.002:0.024;
% initial conditions
y0 = [  .1; 0;
        .1; 0];
dt = 0.001;
N = 1000/dt;
x = [];
lm = N/2;
npar = length(Ps);

figure
hold on
for i = 1:npar
    pars = setpressurepar_reduce(Ps(i));
    y = soltwomassmodel_reduce(y0, pars, dt, N);
    
%     flg = find(y(2,1:end-1)<0&y(2,2:end)>0);
%     x{i} = y(1,flg(flg>lm));
%     plot(ones(size(x{i}))*kc(i),x{i},'r.')

    % implement Henon's trick to calculate Poincare section
    xp = twomass_reduce_henon(y(:,lm+1:end),0,pars);
    x{i} = xp;
    plot(ones(1,size(xp,2))*Ps(i),xp(3,:),'r.')
end

