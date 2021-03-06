
kc = 0.03:0.005:0.05;
% initial conditions
y0 = [  .1; 0;
        .1; 0];
dt = 0.001;
N = 1000/dt;
x = [];
lm = N/2;
npar = length(kc);

figure
hold on
for i = 1:npar
    pars = settensionpar_reduce(kc(i));
    y = soltwomassmodel_reduce(y0, pars, dt, N);
    
%     flg = find(y(2,1:end-1)<0&y(2,2:end)>0);
%     x{i} = y(1,flg(flg>lm));
%     plot(ones(size(x{i}))*kc(i),x{i},'r.')

    % implement Henon's trick to calculate Poincare section
    xp = twomass_reduce_henon(y(:,lm+1:end),0,pars);
    x{i} = xp;
    plot(ones(1,size(xp,2))*kc(i),xp(3,:),'r.')
end

