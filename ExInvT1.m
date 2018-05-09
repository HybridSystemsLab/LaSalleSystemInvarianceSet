%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation of Examples from TOOLS FOR THE STUDY OF STABILITY AND CONVERGENCE IN SET
% DYNAMICAL SYSTEMS WITH APPLICATIONS TO FEEDBACK CONTROL
% Example: 4 Invariance Theorem, part 1
% Nathalie Risso. nrisso@email.arizona.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X0=newset2d([0.5,2],[0.5,2],200);
J=7;
[f,c]=size(X0);
X=zeros(f,2,J);
% include initial value
X(:,:,1)=X0;
alpha = 0.75;
close all;
for j=1:J-1
    for i_f=1:f
    X(i_f,1,j+1)=alpha*X(i_f,2,j)./(1+(X(i_f,1,j)).^2);
    X(i_f,2,j+1)=alpha*X(i_f,1,j)./(1+(X(i_f,2,j)).^2);
    end
end
% plots
az = 40;
el = 15;
close all
figure(1)
for i=1:J
   plot3(X(:,1,i),X(:,2,i),0*X(:,2,i)+i-1,'LineWidth',1); 
   xlabel('$x_1$','Interpreter','latex');ylabel('$x_2$','Interpreter','latex');zlabel('$j$','Interpreter','latex')
   hold on;
   grid on
   view(az, el);
end
hZLabel = get(gca,'ZLabel');
set(hZLabel,'rotation',0,'VerticalAlignment','middle')
hZLabelPos = get( hZLabel , 'position');
hZLabelPos(1) = -0.2;
set(  hZLabel , 'position' , hZLabelPos);
print -depsc -tiff -r300 ExInv1

figure(2)
for i=1:J
   plot(X(:,1,i),X(:,2,i),'.','LineWidth',1); 
   xlabel('$x_1$','Interpreter','latex');ylabel('$x_2$','Interpreter','latex');
   hold on;
   grid on
end
 hYLabel = get(gca,'YLabel');
 set(hYLabel,'rotation',0,'VerticalAlignment','middle')
 hYLabelPos = get( hYLabel , 'position');
hYLabelPos(1) = -0.1;
set(  hYLabel , 'position' , hYLabelPos);
