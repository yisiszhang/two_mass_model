% test two mass par
clear
y0 = [  .1; 0;
        .1; 0;
        .1; 0;
        .1; 0];
dt = 0.001;
N = 2000/dt;
Q = 1;
po = 1/4;
epsilon = 0.01;
m1 = 0.125 * Q;
m2 = 0.025 * Q;
k1 = 0.08 * Q^(po);
k2 = 0.008 * Q^(po);
kc = 0.0451 * Q^(po);
c1 = 3 * k1;
c2 = 3 * k2;
r1 = 0.01;%2 * epsilon * sqrt(m1*k1);
r2 = 0.01;%2 * epsilon * sqrt(m1*k1);
a10 = 0.1 * Q^(2*po);
a20 = 0.1 * Q^(2*po);
l = 1.4 * Q^(po);
d1 = 0.25 * Q^(po);
d2 = 0.05 * Q^(po);
Ps = 0.015;
pars = [m1
        m2
        m1
        m2
        k1
        k2
        k1
        k2
        r1
        r2
        r1
        r2
        c1
        c2
        c1
        c2
        kc
        kc
        a10
        a20
        d1
        d2
        l
        Ps
        ];
y = soltwomassmodel(y0, pars, dt, N);

figure(2)
% plot3(y(1,:),y(2,:),y(3,:))
plot(y(1,:))