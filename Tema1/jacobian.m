function [F_x, J_x, F_X, J_X] = jacobian(loss_func, X_lm, x_lm, A, y_real)

    [n_samples, ~] = size(A);
    [n_features, m_neurons] = size(X_lm);

    t = 1e-100i;

    % =========================
    % --- JACOBIAN PENTRU x ---
    % =========================
    F_x = loss_func(y_real, siglin(A * X_lm) * x_lm);
    J_x = zeros(length(F_x), m_neurons);

    for j = 1:m_neurons
        x_perturb = x_lm;
        x_perturb(j) = x_perturb(j) + t;

        y_pred_pert = siglin(A * X_lm) * x_perturb;
        F_pert = loss_func(y_real, y_pred_pert);

        J_x(:, j) = real((F_pert - F_x) / t);
    end

    % ==========================
    % --- JACOBIAN PENTRU X ---
    % ==========================
    F_X = F_x;  % aceeași funcție obiectivă

    J_X = zeros(length(F_X), n_features * m_neurons);
    for j = 1:(n_features * m_neurons)
        X_perturb = X_lm;
        X_perturb(j) = X_perturb(j) + t;

        y_pred_pert = siglin(A * X_perturb) * x_lm;
        F_pert = loss_func(y_real, y_pred_pert);

        J_X(:, j) = real((F_pert - F_X) / t);
    end
end
