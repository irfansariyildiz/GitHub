%%initial position variables defining
N=10;%%Particles number
xRange=3;
yRange=2;
x=[-xRange + (xRange+xRange)*rand(N,1)];%%range between -3<x<3
y=[-yRange + (yRange+yRange)*rand(N,1)];%%range between -2<y<2
Vix=zeros(1,N);%%first velocity x 
Viy=zeros(1,N);%%first velocity y
Pbpx=x;%%Particle best position x
Pbpy=y;%%Particle best position y
w=0.75; %%Weight
r1=rand(N,1);
r2=rand(N,1);
c1=1.5;
c2=2.0;
%%find location all particles
 for i=1:10  
   z = (4 - 2.1*x.^2 + x.^4/3).*x.^2 + x.*y + 4*(-1 + y.^2).*y.^2;
 end
 minZ=min(z);%%find minimum and Global Best Position
%%find Global Best Position
for i=1:N
    if minZ==z(i)
        Gbx=x(i);
        Gby=y(i);
    end
end
%%update velocity of particles
for i=1:N
    Vixn(i)=(w*Vix(i)+(c1*r1(i))*(Pbpx(i)-x(i))+(c2*r2(i))*(Gbx-x(i)));
    Viyn(i)=w*Viy(i)+(c1*r1(i))*(Pbpy(i)-y(i))+(c2*r2(i))*(Gby-y(i));

%%find new position for all particles
    xnew(i)=x(i)+Vixn(i);
    ynew(i)=y(i)+Viyn(i);
    if xnew(i)>3
    xnew(i)=3;
    elseif xnew(i)<(-3)
    xnew(i)=(-3);
    end
    if ynew(i)>2
    ynew(i)=2;
    elseif ynew(i)<(-2)
    ynew(i)=(-2);
    end
    
end

%%next generations(itteration Part)/////////////////////////////////////////////
R=input('itteration number');
for i=1:R
%%find location all particles
 for i=1:10  
   znew = (4 - 2.1*xnew.^2 + xnew.^4/3).*xnew.^2 + xnew.*ynew + 4*(-1 + ynew.^2).*ynew.^2;
   if z(i)<znew(i) %% Check the best position of particles
       znew(i) = z(i)
       xnew(i) = x(i)
       ynew(i) = y(i)
       Pbpx(i)=x(i);%%Particle previous best position x
       Pbpy(i)=y(i);%%Particle previous best position y
   end
     Pbpx(i)=xnew(i);%%Particle best position x
     Pbpy(i)=ynew(i);%%Particle best position y  
 end
 minZ=min(znew);%%find minimum and Global Best Position
%%find Global Best Position
for i=1:N
    if minZ==znew(i)
        Gbx=xnew(i);
        Gby=ynew(i);
    end
end
for i=1:N %%rearrange variables
    x(i)=xnew(i);
    y(i)=ynew(i);
    Vix=Vixn;
    Viy=Viyn;
    z=znew;
end
%%update velocity of particles
for i=1:N %%
    Vixn(i)=(w*Vix(i)+(c1*r1(i))*(Pbpx(i)-x(i))+(c2*r2(i))*(Gbx-x(i)));
    Viyn(i)=w*Viy(i)+(c1*r1(i))*(Pbpy(i)-y(i))+(c2*r2(i))*(Gby-y(i));

%%find new position for all particles
    xnew(i)=x(i)+Vixn(i);
    ynew(i)=y(i)+Viyn(i);
    if xnew(i)>3
    xnew(i)=3;
    elseif xnew(i)<(-3)
    xnew(i)=(-3);
    end
    if ynew(i)>2
    ynew(i)=2;
    elseif ynew(i)<(-2)
    ynew(i)=(-2);
    end
    
end

end
 clc
 %% Results
fprintf("global minumum x koordinatı");
disp(Gbx);
fprintf("global minumum y koordinatı");
disp(Gby);
fprintf("global minumum z");
disp(min(z));




  
  