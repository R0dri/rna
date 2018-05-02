                                % FUNCIONES DE ACTIVACION
%% Funcion Sigmoidal
function [output] = f_sig(x)
  output = 1./(1+exp(-x));
end
