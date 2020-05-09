y=[15,25,55,115,144,242]%diclaring y vector
semilogy(y,'s--r',10,'LineWidth',4)%semilog plot of y vector
xlim([0 7])%setting xlimits
xlabel('years')%labeling x
ylabel('no.of Students')%labeling y
title('Semilog plot')%setting title to the plot



img=imread("C:\\Users\\MATRA\\OneDrive\\Desktop\\IITM_MAP.jpg");%reading image from dir
colormap();%setting color map
subplot(2,2,1),imagesc(img)%creating subplot with index 1
axis("square")%setting axix type
title('square')
hold on
subplot(2,2,2),imagesc(img)%creating subplot with index 2
axis("tight")%setting axix type
title('tight')
hold on
subplot(2,2,3),imagesc(img)%creating subplot with index 3
axis("equal")%setting axix type
title('equal')
hold on
subplot(2,2,4),imagesc(img)%creating subplot with index 4
axis("xy")%setting axix type
title('xy')


bar(rand(5,1),'r')%plotting bar graph of 5 random numbers 
title('bar graph of 5 random values')%setting title


Z0=rand(5);%declaring a vector of 5 random values
[X0, Y0] = meshgrid ([1:5],[1:5]);%creating a mesh grid
[X1, Y1] = meshgrid ([1:0.1:5],[1:0.1:5]);%creating a meshgrid
Z1 = interp2 (X0, Y0, Z0, X1, Y1,"cubic")%setting a cubic reation between points to smooth the curve
colormap("hsv")%setting color map
surf(Z1)%creating a surface plot
shading("interp")%smoothing the curve
hold on 
contour(Z1)%creating shadows the 3d plot for a 2d vizualisation
colorbar%creating color bar
caxis([0,1])

load('noisydata.mat')%loading data
function smoothed=rectFilt(v,width)%defining a funtion
  if(mod(width,2)==0)%intializing a a if condition to check the entered number is even or not.
     width=width+1;
  end   
   plot(v,'.b','markersize',20)%ploting the actuall data
   hold on
  a=(width-1)/2;%defining a parameter 'a' for symmetry
  for i=1:a
      v=[1,v,1];%solving the end problem... creating a symmetry at end points
  end;
  s=[];
  for i=(a+1):(length(v))%for loop to find mean
      smoothed=mean(v(i-a:(i-(a+1))+a));%calculating moving symmetry average
      s(i)=smoothed;
  end;    
  s(1:(a+1))=[];
  s(end-(a-2):end)=[];%setting the vector to its intial 
  plot(s,'r')%ploting the smoothed data
 endfunction 