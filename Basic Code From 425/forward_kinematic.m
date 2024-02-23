% Forward kinematics script given joint variables

function x = forward_kinematic(q, D2, D6)
    t1 = q(1); t2 = q(2); d3 = q(3); t4 = q(4);
    t5 = q(5); t6 = q(6); d2 = D2; d6 = D6;

    % 0T6 for the Stanford manipulator:
    tx = cos(t1)*sin(t2)*d3 - sin(t1)*d2 + d6*(cos(t1)*cos(t2)*cos(t4)*sin(t5)+ ...
        cos(t1)*cos(t5)*sin(t2)-sin(t1)*sin(t4)*sin(t5));
    ty = sin(t1)*sin(t2)*d3 + cos(t1)*d2 + ...
        d6*(cos(t1)*sin(t4)*sin(t5) + cos(t2)*cos(t4)*sin(t1)*sin(t5) + cos(t5)*sin(t1)*sin(t2));
    tz = cos(t2)*d3 + d6*(cos(t2)*cos(t5)-cos(t4)*sin(t2)*sin(t5));
    tn = [tx; ty; tz];

    x = double(tn);
end