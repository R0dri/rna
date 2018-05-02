function [y_neurona h] = forward(w, normal)
                                % Forward

  [pixeles muestras] = size(normal);
  load var/neuronas.mat

  for im = 1:muestras % Repetir pora todas las entradas.
    for c = 1:length(neuronas) % Selector de Capa
      for n = 1:neuronas(c)      % Selector de Neurona

        %% Funcion de Activacion
        if(c==length(neuronas))
          N(n,c,im) = f_sig(N(n,c,im));
        else
          N(n,c,im) = f_relu(N(n,c,im));
        end

        %% Evaluacion de pesos
        N(n,c,im) = sum(w(n,:,c)*normal(:,im));

      end
    end
    disp(strcat('Imagen: ',num2str(im)))
  end

  %% Extraccion hipotesis
  h = permute(y_neurona(1:neuronas(end),end,:),[3 1 2]);

end
