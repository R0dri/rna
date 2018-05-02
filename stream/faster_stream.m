clear all
clc

p = input("Insert a desired Delay: ");
it = input("Insert the desired iterations: ");

for i = 1:it;
  % http autofocus ->
  % min=2.3427 max=3.4072 mean=2.9048 p=0
  t = time();
  imread('http://192.168.0.21:8080/photoaf.jpg');
  httpaf(i) = time()-t;
  disp(["httpaf " num2str(httpaf(i))])
  %fflush(stdout);
  pause(p)

  % http
  % min=0.91487 max=2.0939 mean=1.2087 p=0
  t = time();
  imread('http://192.168.0.21:8080/photo.jpg');
  http(i) = time()-t;
  disp(["http " num2str(http(i))])
  %fflush(stdout);
  pause(p)

  % http
  % min=0.91487 max=2.0939 mean=1.2087 p=0
  t = time();
  imread('http://192.168.0.21:8080/shot.jpg');
  httpsht(i) = time()-t;
  disp(["shot " num2str(httpsht(i))])
  %fflush(stdout);
  pause(p)
end

disp(['noaf ' num2str(min(http))    '  ' num2str(max(http))    '  ' num2str(median(http))])
disp(['af   ' num2str(min(httpaf))  '  ' num2str(max(httpaf))  '  ' num2str(median(httpaf))])
disp(['shot ' num2str(min(httpsht)) '  ' num2str(max(httpsht)) '  ' num2str(median(httpsht))])
