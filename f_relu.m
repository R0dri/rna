                                % FUNCIONES DE ACTIVACION
%% Funcion RELU
function [output] = f_relu(x)
  output = x.*(x>0);
  output+=1;
  output-=1;
end
