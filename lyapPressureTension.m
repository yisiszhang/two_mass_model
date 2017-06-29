clear
Ps = 0.002:0.002:0.03;
kfac = 1:20;
Q = [1 15];
% initial conditions
y0 = [  .1; 0;
        .1; 0];
dt = 0.001;
N = 1000/dt;

npar1 = length(Ps);
npar2 = length(kfac);
lyap = zeros(npar1,npar2,2);

lm = N/2;
npar = length(Ps);

for k = 1:2
for i = 1:npar1
    for j = 1:npar2
        pars = setpressuretension_scale_reduce(Ps(i),kfac(j),Q(k));
        y = soltwomassmodel_reduce(y0, pars, dt, N);

        % implement Henon's trick to calculate Poincare section
%         xp = twomass_reduce_henon(y(:,lm+1:end),0,pars);
        t = (0:lm-1)/dt;
        xp = twomass_reduce_henon_time([y(:,lm+1:end); t],0,pars);

        % calculate lyapunov exponent
        xp = xp(:,2:end) - xp(:,1);
        dz = log(sum(xp(1:end-1,:).^2));
        beta = polyfit(xp(end,:),dz,1);
        lyap(i,j,k) = beta(1);
    end
end
end

figure
subplot(1,2,1)
imagesc(kfac,Ps,lyap(:,:,1))
axis xy
clim = caxis;
subplot(1,2,2)
imagesc(kfac,Ps,lyap(:,:,2))
axis xy
caxis(clim)