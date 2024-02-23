% Im writing this function assuming that calculating the angular jacobian
% is not required, as it was requested in the assignment.

% Function takes joint variables first then fixed dimensions d2 and d6.
function mu = manipulability(q, D2, D6)
    % Call lin_jac() function to get the Jacobian matrix
    Jv = lin_jac(q, D2, D6);
    
    % Compute manipulability via Redundant Manipulability Formula.
    mu = sqrt(det(Jv * Jv'));
    
    % Display manipulability
    % disp("The Manipulability of the robot is: ");
    % disp(mu);
end
