function [w ,xi] = gw(n)
%function returns vector of xi locations and w weights for gaussian
%integration with n points
%assumins integral is over 0-1
switch n
    case 1
        xi = [0.5];
        w = [1];
    case 2
        xi =[0.5-sqrt(3)/6;
            0.5+sqrt(3)/6];
        w = [0.5
            0.5];
    case 3
        xi = [0.5-sqrt(3/20)
            0.5
            0.5+sqrt(3/20)];
        w = [5/18
            4/9 
            5/18];
    case 4
        xi = [0.5-sqrt((3+2*sqrt(6/5))/28)
            0.5-sqrt((3-2*sqrt(6/5))/28)
            0.5+sqrt((3-2*sqrt(6/5))/28)
            0.5+sqrt((3+2*sqrt(6/5))/28)];
        w = [(18-sqrt(30))/72
            (18+sqrt(30))/72
            (18+sqrt(30))/72
            (18-sqrt(30))/72];
    case 5
        xi = [0.5-1/6*sqrt((5+2*sqrt(10/7)))
            0.5-1/6*sqrt((5-2*sqrt(10/7)))
            0.5
            0.5+1/6*sqrt((5-2*sqrt(10/7)))
            0.5+1/6*sqrt((5+2*sqrt(10/7)))
            ];
        w = [(322-13*sqrt(70))/1800
            (322+13*sqrt(70))/1800
            128/450
            (322+13*sqrt(70))/1800
            (322-13*sqrt(70))/1800        
        ];
end
