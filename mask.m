                                % Mascara y filtro
function bin = mask (pic)
fac = input(" de escalamiento: ");

while(1)
  disp("NewPic")
  %%pic = imread('http://192.168.0.125:8080/shot.jpg');
  %figure 1;
  pic = pic(:,50:115);
  %imshow(pic);
  black = min(min(pic));
  white = max(max(pic)); 


  figure 2;
  pic -=black;
  pic*=255/(white-black);
  bin = pic/fac;
  bin*=fac;

  imshow(bin*fac);
end
