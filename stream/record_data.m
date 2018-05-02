clear all
clc

cd ~/Downloads/img/remote3
it = input("Insert the desired iterations: ");

for i = 1:it;
  t = time();
  imwrite(imread('http://172.20.10.5:8080/shot.jpg'),strcat(num2str(i), '.jpg'));
  httpsht(i) = time()-t;
  disp(["FrameRate: " num2str(1/httpsht(i))]) % Print Framerate
end

                                % Show Stats
%% Display framerates.
disp(['shot ' num2str(min(httpsht)) '  ' num2str(max(httpsht)) '  ' num2str(median(httpsht))])

cd ~/Dropbox/Universidad/Robotica
