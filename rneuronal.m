clear all
clc
more off
pkg load image

  % Inizializacion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                % *Lectura de Datos*
%% Directorio de las imagenes
dir = '~/Downloads/Imagenes/'

%% Lectura entradas y etiquetas
[normal y_real] = lectura(dir);

                                % Parametrización
%% Parametros Red
[pixeles muestras] = size(normal);
m = 1
learn_rate = 1
reg_param = 0
%% Cargar Estructura de neuronas
load var/neuronas.mat
npix = [pixeles neuronas]
maxn = max(neuronas);

%% Bias
bias = rand(length(neuronas),1);
%normal = [normal; bias];

                                % Definicion de Pesos Iniciales
w = zeros(pixeles,max(neuronas),length(neuronas));

for capas = 1:length(neuronas)
  w(:,:,capas) = [rand(npix(capas),neuronas(capas))*(2*eps)-eps zeros(npix(capas),maxn-neuronas(capas));zeros(pixeles-npix(capas), maxn)];
  %%w(:,:,capas) = [rand(pixeles,neuronas))];
  % w (inputs, neuronas, capas)
end

%{
maxn = max(neuronas);
w_init = rand(pixeles,neuronas(1));
w_hidden = zeros(max(neuronas),max(neuronas),length(neuronas)-1)
for c = 1:length(neuronas)-1
  w_hidden(:,:,c) = [rand(neuronas(c),neuronas(c+1)) zeros(maxn-neuronas(c),maxn-neuronas(c+1); zeros(maxn-neronas(c+1),maxn-neuronas(c)))];
end
%}

whos

if(!yes_or_no("Parameters has been set, do you want to train?..."))
 terminate
end

clear pixeles dir capas


  % Entrenamiento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Interfaz de numero de entrenamientos
%for iter = 1:input("Ingrese el numero de entrenamientos: ")
for im = 1:muestras

  %% Forward
  [h y_neurona] = forward(w,normal(:,im),bias);

                                % Calculo del Error
  %% Asignacion de costos
  y_logical = y_real'== 1;
  [out in] = size(y_logical);
  for o = 1:out
    for i = 1:in
      cost(o,i) = -sum(log10(h(y_logical(o,i))))-sum(log10(1-h(~y_logical(o,i))));
    end
  end
  %% Quitar -0
  cost+=eps;
  cost-=eps;
  clear o i out in y_logical

  %% Costo total
  net_error = mean(mean(cost))
  costo_simple = h-y_real';
  fit = (1-mean(mean(costo_simple)))*100


  if(!yes_or_no("Error has been calculated, do you want to backpropagate?..."))
    terminate
  end

  %% Costo total
  %J(iter) = -(1/m)*sum(cost)+learn_rate*(1/(2*m))*sum(w.^2);
  J = -(1/m)*sum(sum(cost))+reg_param*(1/(2*m))*sum(sum(sum(w.^2)))



  dg_relu = 0

  delta(capa) = costo_simple;
  dz_end = costo_simple';
  dw_end = w(1:pixn(capa),1:neurona(capas),end);
  dw_end = y_neurona(1:pixn(capa),1:neurona(capas),:)*dzend;
  db_end = 0;
  for capa = length(neurona):1
    dg_sig = a(capa).*(1-a(capa))
    delta(capa) = w(1:pixn(capa),1:neurona(capas),capas)'*dg_sig;

    %% w (inputs, neuronas, capas)
  end
                                % Red de Neuronas - Backpropagation
  %% Gradient Descent
  w-=learn_rate*sum(h-y_real)*x;
  w = w(1-learn_rate*reg_param/m)-learn_rate*sum(h-y_real)*x;



end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                % Guardar Parametros entrenados

save("pesos.mat","w");
