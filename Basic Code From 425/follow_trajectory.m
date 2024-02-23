% Follow Trajectory The function should take p0, pf and tf as its inputs, 
% and return a set of joint variables qi(t), desired end effector positions 
% p_desired(t), actual end effector positions x(t) and manipulability values μ(t) as
% outputs, where t are equally spaced time points from 0 to tf at increments 
% of ∆t s. You can choose ∆t, e.g. 0.01 s.

function [qi, p_desired, x, mu] = follow_trajectory(p0, pf, tf, q, D2, D6)
    % Define time parameters
    delta_t = 0.01;
    num_steps = length(0:delta_t:tf);
    
    % p(t) = a0 + a1*t + a2*t^2 + a3*t^3
    % Set coefficients 
    a0 = p0; 
    a1 = zeros(3,1);      
    a2 = 3 * (pf - p0) / tf^2; 
    a3 = -2 * (pf - p0) / tf^3;
    
    % Initialize arrays to store results
    qi = zeros(6, num_steps);
    x = zeros(3, num_steps);
    p_desired = zeros(3, num_steps);
    mu = zeros(1, num_steps);
    
    % Initialize initial joint configuration
    q_current = q;
   
    
    % Iterate over time steps t and position steps i.
    for i = 1:num_steps
        t = (i-1)*delta_t;

        % Calculate desired and actual positions.
        p_desired(:, i)= a0 + a1*t + a2*t^2 + a3*t^3;
        x(:, i) = forward_kinematic(q_current,D2,D6);

        % Trajectory Algorithm from slide 20 W4L1.
        diff = p_desired(:, i) - x(:, i);
        dq = pinv(lin_jac(q_current, D2, D6)) * diff;
        q_current = q_current + delta_t * dq;
        
        % Store axuilary variables qi and mu. 
        qi(:, i) = q_current;
        mu(:, i) = manipulability(q_current,D2,D6);
    end

end
