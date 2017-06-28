function pars = setscalepar_reduce(Q)

po = 1/4;

epsilon = 0.01;
m1 = 0.125 * Q;
m2 = 0.025 * Q;
k1 = 0.08 * Q^(po);
k2 = 0.008 * Q^(po);
kc = 0.025 * Q^(po);
c1 = 3 * k1;
c2 = 3 * k2;
r1 = 2 * epsilon * sqrt(m1*k1);
r2 = 2 * epsilon * sqrt(m1*k1);
x10 = 0.04 * Q^(po);
x20 = 0.02 * Q^(po);
l = 1.4 * Q^(po);
a10 = l * x10;
a20 = l * x20;
d1 = 0.25 * Q^(po);
d2 = 0.05 * Q^(po);
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