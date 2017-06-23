
Q = logspace(-1.3,0,10);
% initial conditions
y0 = [  .1;.1;
        .1; 0;
        .1;.1;
        .1; 0];
dt = 0.001;
N = 1000/dt;
x = [];
lm = N/2;
figure
hold on
for i = 1:length(Q)
    pars = setscalepar(Q(i));
    y = soltwomassmodel(y0, pars, dt, N);
    flg = find(y(2,1:end-1)<0&y(2,2:end)>0);
    x{i} = y(1,flg(flg>lm));
    plot(log10(ones(size(x{i}))*Q(i)),x{i},'r.')
end

