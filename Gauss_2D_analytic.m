function out = gauss_2D(fun,a,b,c,d,N,M)
%function that integrates the field A using Gaussian integration
% N,M : gauss points used along x and y.

%define Jacobian
%YOUR CODE HERE
% our gauss point library (file gw.m) contains coordinates defined in the [0,1]
% interval. Therefore we use 2 variables ksi and eta defined in the [0,1]
% interval which is equivalent to [a,b] for x and [c,d] for y coordinates. So that:
% x=a+(b-a)*ksi;
% y=c+(d-c)*eta;
%hence Jacobian matrix: [d_x/d_ksi, d_x/d_eta; d_y/d_ksi, d_y/d_eta]
% determinant of Jacobian matrix:
J=det([(b-a),0;0,(d-c)]);

% define grid vectors 
[wx, ksig] = gw(N);
[wy, etag] = gw(M);

I = 0;

for i = 1:M
    yg = c+etag(i)*(d-c);
    sum = 0;
for j = 1:N
    xg=a+ksig(j)*(b-a);
    fxy=fun(xg,yg);
    sum = sum + wx(j).*fxy;
end 
    I = I +wy(i).*sum; 
end 

out=J*I;



