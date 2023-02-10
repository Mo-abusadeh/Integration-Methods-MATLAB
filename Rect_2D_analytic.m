function out = Rect_2D_analytic(fun,a,b,c,d,N,M)
%function that integrates the field A using the Rectangle method over an
%image A with voxel locations defined in X and Y. Such that A(i,j) is
%locatied at X(i) Y(j). M and N are the number of intervlas in the X and Y
%directions. a,b define the upper and lower limits of the x interval.
%c,d define the upper and lower limits of the y interval

%define spacing
hx = (b - a)/N; % total points: N+1
hy = (d - c)/M;

% define grid vectors
xg = a:hx:b;
yg = c:hy:d;
[xxg, yyg] = ndgrid(xg,yg);

%evaluate our function at these points
U = fun(xxg,yyg);

%define vectors of points to evaluate in x and y directions

ix=1:N; % all left points of each interval
iy=1:M;

%sum all equally weighted points
s=sum(sum(U(ix,iy))); % sum at left points of each interval

%Sum evaluations and save in out
out=s*hx*hy;
