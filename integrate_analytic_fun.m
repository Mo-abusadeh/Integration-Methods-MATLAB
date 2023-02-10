close all; clearvars; clc;

%% Q2 1)
% Define the function
F = @(x,y) (x.^4).*exp(y.^2);

% Setting up the plot
xmin = -1;
xmax = 1;
ymin = -1;
ymax = 1;
[X,Y] = meshgrid(linspace(xmin,xmax), linspace(ymin,ymax));
Z = F(X,Y);

% Create the Graph
figure;
surf(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('F(x,y)');
title('Plot of F(x,y)');

%% Q2) 3)

%define integration method
sel_meth = -1;
disp('Integration Method:');
disp('1) Rectangular,     2)  Trapezium,     3)  Simpsons     4)  Gaussian');

%ensure that correct number is provided
while (sel_meth~=1 && sel_meth~=2 && sel_meth ~=3 && sel_meth ~=4 )

    sel_meth = input('Please Select integration method: 1,2,3 or 4  ');

end

%Inputing the lower limits of integration for x and y
x_min=inf; y_min=inf;
disp('Set the lower limits for integration:');

while (isinf(x_min) && isnumeric(x_min))
    x_min = input('In the x direction: ');
end

while (isinf(y_min) && isnumeric(y_min))
    y_min = input('In the y direction: ');
end

%Inputing the upper limits of integratin for x and y
x_max=-inf; y_max=-inf;
disp('Set the upper limits for integration:');

while (isinf(x_max) && isnumeric(x_max) && (x_max<x_min) )
    x_max = input('In the x direction: ');
end

while (isinf(y_max) && isnumeric(y_max) && (y_max<y_min) )
    y_max = input('In the y direction: ');
end

%x_min=-1; x_max=0; y_min=0; y_max=2; (Integration Limits in this question)

%Switch Statement that corresponds to the inputed desired method of
%integration
switch sel_meth

    %Finding the required values of integration using the three methods of
    %refinement for the Rectangle Method
    case 1
        x=0;
        for i = 8:2:80
            x= x+1;
            N = i;
            M = 8;
            INTEGRAL_Rec_a(x)=Rect_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);

            M = i;
            N = 8;
            INTEGRAL_Rec_b(x)=Rect_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);

            M = i;
            N = i;
            INTEGRAL_Rec_c(x)=Rect_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);
        end

        %Plotting the three lines corresponding to each type of refinement
        %on the same figure for comparison (Rectangle Method)
        figure;
        plot (8:2:80,INTEGRAL_Rec_a, "b-"); hold on;
        plot (8:2:80,INTEGRAL_Rec_b, "r-"); hold on;
        plot (8:2:80,INTEGRAL_Rec_c, "g-");
        xlabel('Number of Intervals');
        ylabel('Values of The Integral');
        legend ('Method a','Method b','Method c')
        title('The Change in Integration values for Rectangle Rule with Progressive Refinement');
        METHOD= 'Rectangle';

    %Finding the required values of integration using the three methods of
    %refinement for the Trapizium Method
    case 2
        x=0;
        for i = 8:2:80
            x = x+1;

            N = i;
            M = 8;
            INTEGRAL_Trap_a(x)=Trap_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);

            M = i;
            N = 8;
            INTEGRAL_Trap_b(x)=Trap_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);

            M = i;
            N = i;
            INTEGRAL_Trap_c(x)=Trap_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);
        end

        %Plotting the three lines corresponding to each type of refinement
        %on the same figure for comparison (Trapezium Method)
        figure;
        plot (8:2:80,INTEGRAL_Trap_a, "b-"); hold on;
        plot (8:2:80,INTEGRAL_Trap_b, "r-"); hold on;
        plot (8:2:80,INTEGRAL_Trap_c, "g-");
        xlabel('Number of Intervals');
        ylabel('Values of The Integral');
        legend ('Method a','Method b','Method c')
        title('The Change in Integration values for Trapezium Rule with Progressive Refinement');
        METHOD = 'Trapezium';

    %Finding the required values of integration using the three methods of
    %refinement for the Simpson's Method
    case 3
        x=0;
        for i = 8:2:80
            x = x+1;

            N = i;
            M = 8;
            INTEGRAL_Simp_a(x)=simp_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);

            M = i;
            N = 8;
            INTEGRAL_Simp_b(x)=simp_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);

            M = i;
            N = i;
            INTEGRAL_Simp_c(x)=simp_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);
        end

        %Plotting the three lines corresponding to each type of refinement
        %on the same figure for comparison (Simpson's Method)
        figure;
        plot (8:2:80,INTEGRAL_Simp_a, "b-"); hold on;
        plot (8:2:80,INTEGRAL_Simp_b, "r-"); hold on;
        plot (8:2:80,INTEGRAL_Simp_c, "g-");
        xlabel('Number of Intervals');
        ylabel('Values of The Integral');
        legend ('Method a','Method b','Method c')
        title('The Change in Integration values for Simpsons Rule with Progressive Refinement');
        METHOD = 'Simpsons';

    %% Q2) 2)    
    %Finding the value of using the Gaussian integration method   
    case 4

        %Asking for inputing the Gaussian points in x direction
        N = -1;
        disp('Set Number of Gaussian points:');
        while (N<1 || uint8(N)~=N ) % so N has to be < 255 (2^8=256-> max unsigned 8-bit integer : 255)
            N = input('Please provide a positive integer ');
        end
        %Asking for inputing the Gaussian points in y direction
        M = -1;
        disp('Set Number of Gaussian points:');
        while (M<1 ||uint8(M)~=M ) % also M <255
            M = input('Please provide a positive integer ');
        end

        INTEGRAL=Gauss_2D_analytic(F,x_min,x_max,y_min,y_max,N,M);
        METHOD = 'Gauss';

end