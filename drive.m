clear all
close all
more off
pkg load image

load var/pesos.mat
load var/bias.mat

ip = input("Insert the Camera IP: ")
while(1)
  pic = imresize(imgread(strcat(ip,'/shot.jpg'),[50 50]))(1:50*50);
  %% Apply the mask
  pic = mask(pic);

  %% Evaluate the picture
  h = forward(w,pic,bias);

  %%
  r = h(1)
  l = h(2)
  f = h(3)
  b = h(4)

  if(r>0.9)
    %% GO RIGHT
  elseif(l>0.9)
    %% GO LEFT
  elseif(f>0.9)
    %% GO FORWARD
  elseif(b>0.9)
    %% GO BACKWARDS
  else
    %% Take another picture
  end
end
