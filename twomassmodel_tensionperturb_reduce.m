function y = twomassmodel_tensionperturb_reduce(y0, pars, dt, N, mag)

y = zeros(length(y0),N);    
y(:,1) = y0;
for i = 2:N
    yy = y(:,i-1);
    k1=dt*twomass(yy,pars,mag); 
    k2=dt*twomass(yy+k1/2,pars,mag); 
    k3=dt*twomass(yy+k2/2,pars,mag); 
    k4=dt*twomass(yy+k3,pars,mag); 
    y(:,i)=yy+k1/6+k2/3+k3/3+k4/6; 
end

function r = twomass(y, pars,mag)
x1 = y(1);
y1 = y(2);
x2 = y(3);
y2 = y(4);

m1 = pars(1);
m2 = pars(2);
k1 = pars(3) + randn(1)*mag;
k2 = pars(4) + randn(1)*mag;
r1 = pars(5);
r2 = pars(6);
c1 = pars(7);
c2 = pars(8);
kc = pars(9) + randn(1)*mag;
a10 = pars(10);
a20 = pars(11);
d1 = pars(12);
d2 = pars(13);
l = pars(14);
Ps = pars(15);

a1 = a10 + 2*l*x1;
a2 = a20 + 2*l*x2;

if x1>0&&x2>x1
    P1 = Ps*(1-theta(a1,a10))*theta(a1,a10);
elseif x2>0&&x1>=x2
    P1 = Ps*(1-theta(a2,a20)*(a2/a1)^2)*theta(a1,a10);
else
    P1 = Ps*theta(a1,a10);
end

P2 = 0;

r = [y1
     (P1*l*d1*theta(a1,a10) - r1*y1 - k1*x1 - theta(-a1,a10)*c1*a1/2/l - kc*(x1-x2))/m1
     y2
     (P2*l*d2*theta(a2,a20) - r2*y2 - k2*x2 - theta(-a2,a20)*c2*a2/2/l - kc*(x2-x1))/m2
     ];
      
function th = theta(x,x0)
if x>0
	th = tanh(50*(x/x0));
else
	th = 0;
end

