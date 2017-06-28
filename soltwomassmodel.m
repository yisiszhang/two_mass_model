function y = soltwomassmodel(y0, pars, dt, N)

y = zeros(length(y0),N);    
y(:,1) = y0;
for i = 2:N
    yy = y(:,i-1);
    k1=dt*twomass(yy,pars); 
    k2=dt*twomass(yy+k1/2,pars); 
    k3=dt*twomass(yy+k2/2,pars); 
    k4=dt*twomass(yy+k3,pars); 
    y(:,i)=yy+k1/6+k2/3+k3/3+k4/6; 
end

function r = twomass(y, pars)
x1l = y(1);
y1l = y(2);
x2l = y(3);
y2l = y(4);
x1r = y(5);
y1r = y(6);
x2r = y(7);
y2r = y(8);

m1l = pars(1);
m2l = pars(2);
m1r = pars(3);
m2r = pars(4);
k1l = pars(5);
k2l = pars(6);
k1r = pars(7);
k2r = pars(8);
r1l = pars(9);
r2l = pars(10);
r1r = pars(11);
r2r = pars(12);
c1l = pars(13);
c2l = pars(14);
c1r = pars(15);
c2r = pars(16);
kcl = pars(17);
kcr = pars(18);
a10 = pars(19);
a20 = pars(20);
d1 = pars(21);
d2 = pars(22);
l = pars(23);
Ps = pars(24);

r = [y1l
          -(r1l*y1l+k1l*x1l+theta(-a(a10,x1l,x1r,l),a10)*c1l*a(a10,x1l,x1r,l)/2/l+kcl*(x1l-x2l)-l*d1*P1(a(a10,x1l,x1r,l),Ps,min(a(a10,x1l,x1r,l),a(a20,x2l,x2r,l)),a10))/m1l
          y2l
          -(r2l*y2l+k2l*x2l+theta(-a(a20,x2l,x2r,l),a10)*c2l*a(a20,x2l,x2r,l)/2/l+kcl*(x2l-x1l))/m2l
          y1r
          -(r1r*y1r+k1r*x1r+theta(-a(a10,x1r,x1l,l),a10)*c1r*a(a10,x1r,x1l,l)/2/l+kcr*(x1r-x2r)-l*d1*P1(a(a10,x1r,x1l,l),Ps,min(a(a10,x1r,x1l,l),a(a20,x2r,x2l,l)),a10))/m1r
          y2r
          -(r2r*y2r+k2r*x2r+theta(-a(a20,x2r,x2l,l),a10)*c2r*a(a20,x2r,x2l,l)/2/l+kcr*(x2r-x1r))/m2r             
          ];


% r = [y1l
%           -(r1l*y1l+k1l*x1l+theta(-a(a10,x1l,x1r,l),a10)*c1l*a(a10,x1l,x1r,l)/2/l+kcl*(x1l-x2l)-l*d1*P1(a(a10,x1l,x1r,l),a(a20,x2l,x2r,l),Ps,a10))/m1l
%           y2l
%           -(r2l*y2l+k2l*x2l+theta(-a(a20,x2l,x2r,l),a10)*c2l*a(a20,x2l,x2r,l)/2/l+kcl*(x2l-x1l))/m2l
%           y1r
%           -(r1r*y1r+k1r*x1r+theta(-a(a10,x1r,x1l,l),a10)*c1r*a(a10,x1r,x1l,l)/2/l+kcr*(x1r-x2r)-l*d1*P1(a(a10,x1r,x1l,l),a(a20,x2r,x2l,l),Ps,a10))/m1r
%           y2r
%           -(r2r*y2r+k2r*x2r+theta(-a(a20,x2r,x2l,l),a10)*c2r*a(a20,x2r,x2l,l)/2/l+kcr*(x2r-x1r))/m2r             
%           ];
      
function th = theta(x,x0)
if x>0
	th = tanh(50*(x/x0));
else
	th = 0;
end

function r = a(a0,xl,xr,l)
r = a0+l*(xl+xr);
    
function r = P1(a1,Ps,amin,a0)
r = Ps*(1-max(amin,0)*(amin/a1)^2)*theta(a1,a0);
% function r = P1(a1,a2,Ps,a0)
% r = Ps*(1-theta(a2,a0)*(a2/a1)^2);
