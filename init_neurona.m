
%% Interfaz para crear matriz de neuronas
clear neuronas;
capas = 1;

do
  txt = cstrcat("Ingrese el numero de neuronas del Hidden Layer #", num2str(capas), ": ");
  in = input(txt);
  if(isempty(in))
    break;
  end
  neuronas(capas) = in;
  capas++;
until(in<1)

disp(strcat(["Numero de Hidden Layers: " num2str(capas-1)]))
disp("")
in = input("Ingrese el numero de neuronas del Output Layer: ");
neuronas(capas) = in

if(yes_or_no("Guardar vector 'neuronas'? "))
  save("var/neuronas.mat","neuronas")
  disp("Guardado en var/neuronas.mat")
end

clear neuronas in capas txt ans
