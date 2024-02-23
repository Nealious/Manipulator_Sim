% Function takes joint variables first then fixed dimensions d2 and d6.
function Jv = sym_lin_jac(q, D2, D6)
    % Define Symbolic Variables
    syms t1 t2 t4 t5 t6 d2 d3 d6;
    
    % Define tx, ty, tz, and tn
    tx = cos(t1)*sin(t2)*d3 - sin(t1)*d2 + d6*(cos(t1)*cos(t2)*cos(t4)*sin(t5)+ ...
        cos(t1)*cos(t5)*sin(t2)-sin(t1)*sin(t4)*sin(t5));
    ty = sin(t1)*sin(t2)*d3 + cos(t1)*d2 + ...
        d6*(cos(t1)*sin(t4)*sin(t5) + cos(t2)*cos(t4)*sin(t1)*sin(t5) + cos(t5)*sin(t1)*sin(t2));
    tz = cos(t2)*d3 + d6*(cos(t2)*cos(t5)-cos(t4)*sin(t2)*sin(t5));
    tn = [tx ty tz];
    
    % Differentiate each component of tn with respect to each variable in q.
    dtn_dq = sym(zeros(numel(tn), numel(q)));
    Q = [t1 t2 d3 t4 t5 t6];

    for i = 1:numel(tn)
        for j = 1:numel(Q)
            dtn_dq(i,j) = diff(tn(i), Q(j));
        end
    end
    
    % Print Symbolic Jv.
    disp("The Linear Jacobian: ");
    disp(dtn_dq);

    % Substitute Values, Calculate and display Jv.
    Jv = double(subs(dtn_dq, {t1, t2, d3, t4, t5, t6, d2, d6}, {q(1), q(2), q(3), q(4), q(5), q(6), D2, D6}));
    disp("The Linear Jacobian Value is: ");
    disp(Jv);
end
