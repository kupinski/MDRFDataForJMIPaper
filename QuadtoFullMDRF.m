%GPU MDRF for quarter simulation to be mirrored
% 
% fid = fopen('/Users/kdoty/Desktop/splitSiPM.nofiberTesting','rb');
% fid = fopen('/Users/kdoty/Desktop/results/splitSiPM.fiberonly','rb');
fid = fopen('/Users/kdoty/Desktop/results/splitSiPM.finez.nofiber','rb');
% fid = fopen('/Users/kdoty/Desktop/results/splitSiPM.finez.spherical','rb');
row = 9;
sensorcount = 81;
depths = 8;
size = 92;
data = fread(fid, Inf, 'int32');
%scaling to 5000 photons for single gamma event at 140kev and 35.7
%photons/kev
data = data./200;
%quantum efficiency
data = data.* 0.4;
data1 = reshape(data, sensorcount, depths, size, size);
final = zeros(depths,sensorcount,2*size,2*size);

for i = 1:size
    for j = 1:size
        for k = 1:depths
            detector = squeeze(data1(:,k,i,j));
            detector = squeeze(reshape(detector,row,row));
            point1 = i;
            point2 = 2*size - (i-1);
            point3 = j;
            point4 = 2*size - (j-1);
            detector1 = reshape(detector,sensorcount,1);
            detector2 = reshape(flipud(detector),sensorcount,1);
            detector3 = reshape(fliplr(detector),sensorcount,1);
            detector4 = reshape(flipud(fliplr(detector)),sensorcount,1);
            final(k,:,point1,point3) = detector1;
            final(k,:,point1,point4) = detector2;
            final(k,:,point2,point4) = detector4;
            final(k,:,point2,point3) = detector3;
        end
    end
end
final(:,:,:,size+1) = [];
final(:,:,size+1,:) = [];

x = linspace(-91,91,2*size-1);


% for i = 1:sensorcount
% %     sampling from the second depth
% %     imagesc(squeeze(final(2,i,:,:)));
%     mdrf = squeeze(final(2,i,:,:));
%     imagesc(x,x,mdrf);
%     set(gca,'YDir','normal','FontSize',18);
%     caxis([0,1000]);
%     colorbar
%     xlabel("x position (mm)",'FontSize',18)
%     xticks(linspace(-90,90,10))
%     yticks(linspace(-90,90,10))
%     ylabel("y position (mm)",'FontSize',18)
%      title("Spherically Curved Detector")
% %     title("Planar Detector")
% end


 figure
%     sampling from the second depth
    mdrf = squeeze(final(2,41,:,:));
    imagesc(x,x,mdrf);
    set(gca,'YDir','normal','FontSize',18);
    
    % Adjust the aspect ratio to make the plot square
    daspect([1, 1, 1]);

    % Set the position to make sure the resulting figure is square
    set(gca, 'Position', [0.1, 0.1, 0.8, 0.8]);
    
    caxis([0,1000]);
    colorbar
    xlabel("x position (mm)",'FontSize',18)
    xticks(linspace(-90,90,10))
    yticks(linspace(-90,90,10))
    ylabel("y position (mm)",'FontSize',18)
%     title("Curved Detector")
%     title("Planar Detector")
%     title("Monolithic Light Guide and Fiber Optic")
%     title("Fiber Optic as Light Guide")
    title("Monolithic Light Guide")


% figure
% for a = 37:45
% %     sampling from the second depth
%     mdrf = squeeze(final(4,a,92,:));
%     plot(x,mdrf,'LineWidth', 5,'color','b');
%     hold on
%     set(gca,'FontSize',18);
% %     caxis([0,1000]);
% %     colorbar
%     xlabel("x position (mm)",'FontSize',18)
%     xlim([-91,91]);
%     xticks(linspace(-90,90,10))
%     ylabel("number of photons",'FontSize',18)
%     title("Spherically Curved Detector")
% %     title("Planar Detector")
% %     title("Monolithic Light Guide and Fiber Optic")
% %     title("Fiber Optic as Light Guide")
% %     title("Monolithic Light Guide")
%     ylim([0,1200])
%     hold on
% end
% 
% figure  
% for a = 1:9
%     r = 9*(a-1)+5;
% %     sampling from the second depth
%     mdrf = squeeze(final(4,r,:,92));
%     plot(x,mdrf,'LineWidth', 5,'color','b');
%     hold on
%     set(gca,'FontSize',18);
% %     caxis([0,1000]);
% %     colorbar
%     xlabel("y position (mm)",'FontSize',18)
%     xlim([-91,91]);
%     xticks(linspace(-90,90,10))
%     ylabel("number of photons",'FontSize',18)
%     title("Spherically Curved Detector")
% %     title("Planar Detector")
% %     title("Monolithic Light Guide and Fiber Optic")
% %     title("Fiber Optic as Light Guide")
% %     title("Monolithic Light Guide")
%     ylim([0,1200])
%     hold on
%   end
% 
% figure
% %     sampling from the second depth
% mdrf = squeeze(final(2,37,92,:));
%     plot(x,mdrf,'LineWidth', 5);
%     hold on
%     set(gca,'FontSize',18);
% %     caxis([0,1000]);
% %     colorbar
%     xlabel("x position (mm)",'FontSize',18)
%     xlim([-91,91]);
%     xticks(linspace(-90,90,10))
%     ylabel("number of photons",'FontSize',18)
%     title("Cylindrically Curved Detector")
% %     title("Planar Detector")
% %     title("Monolithic Light Guide and Fiber Optic")
% %     title("Fiber Optic as Light Guide")
% %     title("Monolithic Light Guide")
%     ylim([0,1000])
%     mdrf = squeeze(final(2,41,92,:));
%     plot(x,mdrf,'LineWidth',5);
%     xticks(linspace(-90,90,10))
%     hold on
%     legend("Edge SiPM","Center SiPM",'FontSize',15)


% x = linspace(-91,91,2*size-1);
% for i = 1:sensorcount
%     figure
% %     sampling from the second depth
%     mdrf = squeeze(final(1,i,:,:));
%     imagesc(x,x,mdrf);
%     set(gca,'YDir','normal');
%     colorbar
%     can have empty parenthesis for manual enter 
%    pause()
%    drawnow
% end