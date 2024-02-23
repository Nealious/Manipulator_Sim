% The function takes q and fixed variables D2 & D6 to allow testing of
% different variables without rewriting the function.
function Jv = lin_jac(q,D2,D6)
%q=[q(1);q(2);q(3);q(4);q(5);q(6)];
    Jv = [-D6*(cos(q(5))*sin(q(1))*sin(q(2))+cos(q(1))*sin(q(4))*sin(q(5))+cos(q(2))*cos(q(4))*sin(q(1))*sin(q(5)))-D2*cos(q(1))-q(3)*sin(q(1))*sin(q(2)),D6*(cos(q(1))*cos(q(2))*cos(q(5))-cos(q(1))*cos(q(4))*sin(q(2))*sin(q(5)))+q(3)*cos(q(1))*cos(q(2)),cos(q(1))*sin(q(2)),-D6*(cos(q(4))*sin(q(1))*sin(q(5))+cos(q(1))*cos(q(2))*sin(q(4))*sin(q(5))),-D6*(cos(q(1))*sin(q(2))*sin(q(5))+cos(q(5))*sin(q(1))*sin(q(4))-cos(q(1))*cos(q(2))*cos(q(4))*cos(q(5))),0; ...
    D6*(cos(q(1))*cos(q(5))*sin(q(2))-sin(q(1))*sin(q(4))*sin(q(5))+cos(q(1))*cos(q(2))*cos(q(4))*sin(q(5)))-D2*sin(q(1))+q(3)*cos(q(1))*sin(q(2)),D6*(cos(q(2))*cos(q(5))*sin(q(1))-cos(q(4))*sin(q(1))*sin(q(2))*sin(q(5)))+q(3)*cos(q(2))*sin(q(1)),sin(q(1))*sin(q(2)),D6*(cos(q(1))*cos(q(4))*sin(q(5))-cos(q(2))*sin(q(1))*sin(q(4))*sin(q(5))),D6*(cos(q(1))*cos(q(5))*sin(q(4))-sin(q(1))*sin(q(2))*sin(q(5))+cos(q(2))*cos(q(4))*cos(q(5))*sin(q(1))),0; ...
    0,-D6*(cos(q(5))*sin(q(2))+cos(q(2))*cos(q(4))*sin(q(5)))-q(3)*sin(q(2)),cos(q(2)),D6*sin(q(2))*sin(q(4))*sin(q(5)),-D6*(cos(q(2))*sin(q(5))+cos(q(4))*cos(q(5))*sin(q(2))),0];

end