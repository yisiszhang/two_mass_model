% test two mass par
clear
y0 = [  .1; 0;
        .1; 0];
    
dt = 0.001;
N = 1000/dt;

epsilon = 0.01;
m1 = 0.125;
m2 = 0.025;
k1 = 0.08;
k2 = 0.008;
kc = 0.04;
c1 = 3 * k1;
c2 = 3 * k2;
r1 = 2 * epsilon * sqrt(m1*k1);
r2 = 2 * epsilon * sqrt(m1*k1);
x10 = 0.04;
x20 = 0.02;
l = 1.4;
a10 = l * x10;
a20 = l * x20;
d1 = 0.25;
d2 = 0.05;
Ps = 0.015;
pars = [m1
        m2
        k1
        k2
        r1
        r2
        c1
        c2
        kc
        a10
        a20
        d1
        d2
        l
        Ps
        ];
y = soltwomassmodel_reduce(y0, pars, dt, N);

figure(2)
plot(y(1,:))