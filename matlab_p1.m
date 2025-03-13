clc
close all
clear all
load('proj_fit_05.mat')

xid_1 = id.X{1}; 
xid_2 = id.X{2}; 
yid = id.Y;      

xval_1 = val.X{1}; 
xval_2 = val.X{2}; 
yval = val.Y;      

[X1_id, X2_id] = meshgrid(xid_1, xid_2);
[X1_val, X2_val] = meshgrid(xval_1, xval_2);

% Afisam seturile de date de identificare si validare
figure;
surf(X1_id, X2_id, yid);
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Set de Identificare');

figure;
surf(X1_val, X2_val, yval);
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Set de Validare');

% Parametru maxim pentru gradul polinomului
gradPolinomMax = 20;

% Calculam termenii pentru grade diferite si erorile MSE
for gradPolinom = 1:gradPolinomMax
    % Numarul total de termeni pentru gradul curent
    numTermeni = (gradPolinom + 1) * (gradPolinom + 2) / 2;
    phi_id = zeros(numel(X1_id), numTermeni);
    phi_val = zeros(numel(X1_val), numTermeni);
    
    % Construim termenii polinomului intr-un mod generalizat
    h = 1;
    for n = 0:gradPolinom
        for i = 0:n
            j = n - i;
            % Termenul x1^i * x2^j pentru identificare si validare
            phi_id(:, h) = (X1_id(:).^i) .* (X2_id(:).^j);
            phi_val(:, h) = (X1_val(:).^i) .* (X2_val(:).^j);
            h = h + 1;
        end
    end
    
    % Calculam theta si MSE pentru identificare si validare
    theta = phi_id \ yid(:);
    yhat_id = phi_id * theta;
    MSEid(gradPolinom) = sum((yid(:) - yhat_id).^2) / numel(yid(:)); 
    
    yhat_val = phi_val * theta;
    MSEval(gradPolinom) = sum((yval(:) - yhat_val).^2) / numel(yval(:)); 
end

% Graficul MSE pentru a observa minimul
figure;
plot(1:gradPolinomMax, MSEid, '-o', 'DisplayName', 'MSE Identificare');
hold on;
plot(1:gradPolinomMax, MSEval, '-o', 'DisplayName', 'MSE Validare');
xlabel('Grad Polinom');
ylabel('Eroare patrata medie');
legend;
title('MSE in functie de gradul polinomului');

% Stabilim gradul optim manual dupa analiza graficului
gradOptim = 2;
disp(['Gradul optim stabilit manual este: ', num2str(gradOptim)]);

% Calculam modelul doar pentru gradul optim
numTermeniOpt = (gradOptim + 1) * (gradOptim + 2) / 2;
phi_id_opt = zeros(numel(X1_id), numTermeniOpt);
phi_val_opt = zeros(numel(X1_val), numTermeniOpt);

% Construim `phi_id_opt` si `phi_val_opt` pentru gradul optim
h = 1;
for n = 0:gradOptim
    for i = 0:n
        j = n - i;
        phi_id_opt(:, h) = (X1_id(:).^i) .* (X2_id(:).^j);
        phi_val_opt(:, h) = (X1_val(:).^i) .* (X2_val(:).^j);
        h = h + 1;
    end
end

% Calculam theta, MSE pentru identificare si validare cu gradul optim
theta_opt = phi_id_opt \ yid(:);
yhat_id_opt = phi_id_opt * theta_opt;
MSEid_opt = sum((yid(:) - yhat_id_opt).^2) / numel(yid(:));

yhat_val_opt = phi_val_opt * theta_opt;
MSEval_opt = sum((yval(:) - yhat_val_opt).^2) / numel(yval(:));

disp(['MSE pentru identificare la gradul optim: ', num2str(MSEid_opt)]);
disp(['MSE pentru validare la gradul optim: ', num2str(MSEval_opt)]);

% Afisam suprafata aproximata pentru identificare cu grad optim
figure;
surf(X1_id, X2_id, yid); 
hold on;
surf(X1_id, X2_id, reshape(yhat_id_opt, size(X1_id)));
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Suprafata aproximata si datele reale pentru setul de identificare');

% Afisam suprafata aproximata pentru validare cu grad optim
figure;
surf(X1_val, X2_val, yval); 
hold on;
surf(X1_val, X2_val, reshape(yhat_val_opt, size(X1_val)));
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Suprafata aproximata si datele reale pentru setul de validare');
