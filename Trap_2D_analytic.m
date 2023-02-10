function out = Trap_2D_analytic(fun,a,b,c,d,N,M)
%function that integrates the field A using the Simpsonse method. 
%myfunc(x,y,A) is an interpolation function that returns the value of A (a 2D
%array) at the location x,y

%define spacing
hx = (b - a)/N; % total points: N+1
hy = (d - c)/M;

% define grid vectors 
xg = a:hx:b;
yg = c:hy:d;
[xxg, yyg] = ndgrid(xg,yg);

%evaluate our function at these points
U = fun(xxg,yyg);

%First we evaluate corner points (corner node indexing:)
ix_c=[1,N+1];
iy_c=[1,M+1];

%define internal node indexing
ix_i=2:1:N;
iy_i=2:1:M;

%sum corner nodes:
s1=sum(sum(U(ix_c,iy_c)));

%sum edge functions
s2 = 2*sum(sum(U(ix_c,iy_i)));
s3 = 2*sum(sum(U(ix_i,iy_c))); 

%Evaluate internal contributions
s4=4*sum(sum(U(ix_i,iy_i)));

%Sum evaluations and save in out
out=(s1+s2+s3+s4)*hx*hy/4;