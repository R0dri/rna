                                % Forward

function [h a] = forward(w, x, bias)

  [pixeles muestras] = size(x);
  load var/neuronas.mat
  maxn = max(neuronas);

  %% a(:,1,:) = x;
  %%  a(:,2:length(neuronas)+1,:) = zeros();
  a(max(neuronas),length(neuronas),muestras) = zeros();

  for im = 1:muestras % Repetir pora todas las entradas.
    for c = 1:length(neuronas) % Selector de Capa

                             % Evaluacion de pesos
      %% w(input+,neurona,capa) a(input,capas+in,samples)
      if(c==1)
        %%zi(:,c,im) = [sum(w(:,1:neuronas(c),c).*x(:,im)) zeros(1,maxn-neuronas(c))];
        zi(:,c,im) = [sum(w(:,1:neuronas(c),c).*x(:,im))+bias(c) zeros(1,maxn-neuronas(c))];
      else
        z(:,c,im) = [sum(w(1:maxn,1:neuronas(c),c).*a(:,c-1,im))+bias(c) zeros(1,maxn-neuronas(c))];
      end

                                % Funcion de Activacion
      if(c==length(neuronas))
        a(:,c,im)+= f_sig(z(:,c,im)+[ones(neuronas(c),1); ones(maxn-neuronas(c),1)*(-inf)]);
      elseif(c==1)
        a(:,c,im)+= f_relu(zi(:,c,im));
      else
        a(:,c,im)+= f_relu(z(:,c,im));
      end

      input("") % Debuging
    end
    if(!mod(im,10))
    disp(cstrcat('Imagen: ',num2str(im)))
  end

  %% Extraccion hipotesis
  h = permute(a(1:neuronas(end),end,:),[1 3 2]);

end
