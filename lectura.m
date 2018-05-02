function [normalizada y_real] = lectura(dir)

  %% Lectura de imagenes para entrenamiento
  for muestras = 1:length(glob(strcat(dir,'*')))
    pic(:,muestras) = imresize(imread(strcat(dir,num2str(muestras),'.jpg')),[50 50])(1:(50*50));
  endfor

  %% Normalizacion de la imagen
  [pixeles muestras] = size(pic);
  pic_min=min(pic);
  pic_max=max(pic);
  normalizada = (double(pic)-double(pic_min))./double(pic_max);


  %% Lectura de resultados
  y_real = [zeros(20,1) ones(20,1) zeros(20,1);
            zeros(20,1) zeros(20,1) ones(20,1);
            ones(20,1) zeros(20,1) zeros(20,1)];

end
