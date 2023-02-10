function out = simp_2D_analytic(fun,a,b,c,d,N,M)
%function that integrates the field A using Simpsons method over an
%image A with voxel locations defined in X and Y. Such that A(i,j) is
%located at X(i) Y(j). M and N are the number of intervals in the X and Y
%directions. a,b define the upper and lower limits of the x interval.
%c,d define the upper and lower limits of the y interval 


% Ensure the number of intervals is even!
N = 2*ceil(N/2);
M = 2*ceil(M/2);

%define spacing
hx = (b - a)/N;
hy = (d - c)/M;

% define grid vectors 
xg = a:hx:b;
yg = c:hy:d; 
[xxg, yyg] = ndgrid(xg,yg);

%evaluate our function at these points
U = fun(xxg,yyg);

%First we evaluate corner points
s1 = ( U(1,1) + U(1,M+1) + U(N+1,1) + U(N+1,M+1) );

%define vectors of odd and even numbers in each direction
ixo = 2:2:N; 
ixe = 3:2:N-1; 
iyo = 2:2:M; 
iye = 3:2:M-1;

%add in edge functions
s2 = 2*( sum(U(1,iye)) + sum(U(N+1,iye)) + sum(U(ixe,1)) + sum(U(ixe,M+1)) ); 
s3 = 4*( sum(U(1,iyo)) + sum(U(N+1,iyo)) + sum(U(ixo,1)) + sum(U(ixo,M+1)) );

%Evaluate internal contributions
s4 = 16*sum( sum( U(ixo,iyo) ) ) + 4*sum( sum( U(ixe,iye) ) ); 
s5 = 8*sum( sum( U(ixe,iyo) ) ) + 8*sum( sum( U(ixo,iye) ) );

%Sum evaluations and save in out
out = s1 + s2 + s3 + s4 + s5;
out = out*hx*hy/9.0;
