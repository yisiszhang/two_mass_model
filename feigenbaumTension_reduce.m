
kc = 0.03:0.001:0.05;
% initial conditions
y0 = [  .1; 0;
        .1; 0];
dt = 0.001;
N = 1000/dt;
x = [];
lm = N/2;
figure
hold on
for i = 1:length(kc)
    pars = settensionpar_reduce(kc(i));
    y = soltwomassmodel_reduce(y0, pars, dt, N);
    flg = find(y(2,1:end-1)<0&y(2,2:end)>0);
    x{i} = y(1,flg(flg>lm));
    plot(ones(size(x{i}))*kc(i),x{i},'r.')
end

