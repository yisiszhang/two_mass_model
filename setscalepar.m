function pars = setscalepar(Q)

po = 1/4;
% epsilon = 0.01;
% m1 = 0.0015 * Q;
% m2 = 0.0003 * Q;
% k1 = 0.08 * Q^(po);
% k2 = 0.008 * Q^(po);
% kc = 0.025 * Q^(po);
% c1 = 3 * k1;
% c2 = 3 * k2;
% r1 = 2 * epsilon * sqrt(m1*k1);
% r2 = 2 * epsilon * sqrt(m1*k1);
% a10 = 0.0021 * Q^(2*po);
% a20 = 0.00175 * Q^(2*po);
% l = 0.3 * Q^(po);
% d1 = 0.1 * Q^(po);
% d2 = 0.02 * Q^(po);
% Ps = 3;

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
a10 = 0.05 * Q^(2*po);
a20 = 0.025 * Q^(2*po);
l = 2 * Q^(po);
d1 = 0.25 * Q^(po);
d2 = 0.05 * Q^(po);
Ps = 0.05;

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