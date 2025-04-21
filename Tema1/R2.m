function R = R2(y_pred,y_real)
% Calculează coeficientul de determinare R^2
% y_real  – valori reale
% y_pred  – predicții ale modelului

    ss_res = sum((y_real - y_pred).^2);                  % suma pătratelor reziduurilor
    ss_tot = sum((y_real - mean(y_real)).^2);            % suma pătratelor totale
    R = 1 - (ss_res / ss_tot);                           % coeficient R²

end
