function pars = settensionpar(kc)

epsilon = 0.01;
m1 = 0.125;
m2 = 0.025;
k1 = 0.08;
k2 = 0.008;
c1 = 3 * k1;
c2 = 3 * k2;
r1 = 0.01;%2 * epsilon * sqrt(m1*k1);
r2 = 0.01;%2 * epsilon * sqrt(m1*k1);
a10 = 0.1;
a20 = 0.1;
l = 1.4;
d1 = 0.25;
d2 = 0.05;
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