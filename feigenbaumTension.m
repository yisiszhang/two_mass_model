
kc = 0.0443:0.00001:0.0450;
% initial conditions
y0 = [  .1;.1;
        .1; 0;
        .1;.1;
        .1; 0];
dt = 0.01;
N = 2000/dt;
x = [];
lm = N/2;
figure
hold on
for i = 1:length(kc)
    pars = settensionpar(kc(i));
    y = soltwomassmodel(y0, pars, dt, N);
    flg = find(y(2,1:end-1)<0&y(2,2:end)>0);
    x{i} = y(1,flg(flg>lm));
    plot(ones(size(x{i}))*kc(i),x{i},'r.')
end

