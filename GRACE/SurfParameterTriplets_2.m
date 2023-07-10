close all
clear all

mmhstyle=123;
C_0 = 0.9647;
CoopCutoff = 1.19;
CCCutoff = 3.5;
if mmhstyle == 123
    S=load(['FRAPFitToBoth_mmh',num2str(1),'_Both.mat']);
    S2=load(['FRAPFitToBoth_mmh',num2str(2),'_Both.mat']);
    S3=load(['FRAPFitToBoth_mmh',num2str(3),'_Both.mat']);
    FinalParametersDynamic_Both = [S.AnalysisParameters(:,1:12); S2.AnalysisParameters(:,1:12);S3.AnalysisParameters(:,1:12)];
else
    S=load(['FRAPFitToBoth_mmh',num2str(mmhstyle),'_Both.mat']);
    FinalParametersDynamic_Both = [S.AnalysisParameters(:,1:12)];
end


a1 = FinalParametersDynamic_Both(:,1);
a2 = FinalParametersDynamic_Both(:,2);
a3 = FinalParametersDynamic_Both(:,3);
a4 = FinalParametersDynamic_Both(:,4);
a5 = FinalParametersDynamic_Both(:,5);
a6 = FinalParametersDynamic_Both(:,6);
a7 = FinalParametersDynamic_Both(:,7);
n1 = FinalParametersDynamic_Both(:,8);
n2 = FinalParametersDynamic_Both(:,9);

% figure
%[X,Y] = meshgrid(x,y);
%Z = meshgrid(z);
%sup = surf(X,Y,Z)
% plot3(a3,a5,n2,'*')
% %xlim([0 10])
% ylim([0 10])
% zlim([0 3])
% xlabel('a3')
% ylabel('a5')
% zlabel('n2')
% view(3)

% figure
% n1Norm = n1-min(n1);
% n1Norm = n1Norm/max(n1Norm)*10;
% scatter(a1,a4,100,n1,"filled");
% colorbar
% ylim([0 20])
% xlabel('a1')
% ylabel('a4')
% zlabel('n1')
% colormap(copper)
%
%

n2Norm = n2-min(n2);
n2Norm = n2Norm/max(n2Norm)*10;
n2Norm = n2-min(n2);
n2Norm = n2Norm/max(n2Norm)*10;

% figure
% scatter(a4,(C_0.^n1)./a1,100,n1,"filled");
% colorbar
% xlim([0 15])
% ylabel('Ratio of On/Off Dynamics')
% xlabel('Carrying Capacity')
% zlabel('Cooperativity')
% 
% figure
% 
% scatter(a5,(a3.*C_0.^n2)./a2,100,n2,"filled");
% colorbar
% xlim([0 15])
% ylim([0 15])
% ylabel('Ratio of On/Off Dynamics')
% xlabel('Carrying Capacity')
% zlabel('Cooperativity')
% colormap(copper)
%
% [B1,I1] = sort(a1);
% [B2,I2] = sort(a3);
% sum(abs(I1-I2))
%
% [B1,I1] = sort(a4);
% [B2,I2] = sort(a5);
% sum(abs(I1-I2))
%
% [B1,I1] = sort(n1);
% [B2,I2] = sort(n2);
% sum(abs(I1-I2))
% figure
% scatter(a1,a3./a2)

% 
% inRange =  n2<1.2;%a5<50 & a4<50;% & ;
% a1=a1(inRange);
% a2=a2(inRange);
% a3=a3(inRange);
% a4=a4(inRange);
% a5=a5(inRange);
% n1=n1(inRange);
% n2=n2(inRange);


% figure
n1Norm = n1;
n2Norm = n2;

distancesArray = [0 0 0];
for i=1:length(a1)
    Dis = sqrt(((C_0^n1Norm(i))/a1(i)-a3(i)*C_0^n2Norm(i)/a2(i))^2+(a4(i)-a5(i))^2+(n1Norm(i)-n2Norm(i))^2);
    figure(1)
    if n1(i)<CoopCutoff && a4(i)< CCCutoff
        scatter3((C_0.^n1Norm(i))./a1(i),a4(i),n1Norm(i),50,'blue'); 
    elseif n1(i)>CoopCutoff && a4(i)< CCCutoff
        scatter3((C_0.^n1Norm(i))./a1(i),a4(i),n1Norm(i),50,"*",'blue');
    elseif n1(i)<CoopCutoff && a4(i)> CCCutoff
        scatter3((C_0.^n1Norm(i))./a1(i),a4(i),n1Norm(i),50,"square",'blue');
    else
        scatter3((C_0.^n1Norm(i))./a1(i),a4(i),n1Norm(i),50,"diamond",'blue');
    end
    hold on
    if n2(i)< CoopCutoff && a5(i) <CCCutoff
        scatter3((a3(i).*C_0.^n2Norm(i))./a2(i),a5(i),n2Norm(i),50,'red');
    elseif n2(i)> CoopCutoff && a5(i) <CCCutoff
        scatter3((a3(i).*C_0.^n2Norm(i))./a2(i),a5(i),n2Norm(i),50,"*",'red');
    elseif n2(i)< CoopCutoff && a5(i) >CCCutoff
        scatter3((a3(i).*C_0.^n2Norm(i))./a2(i),a5(i),n2Norm(i),50,"square",'red');
    else
        scatter3((a3(i).*C_0.^n2Norm(i))./a2(i),a5(i),n2Norm(i),50,"diamond",'red');
    end
%     if Dis<10
%         figure(2)
%         distancesArray(1) = distancesArray(1)+1;
%     elseif Dis<1000000000000
%         figure(3)
%         distancesArray(2) = distancesArray(2)+1;
%     else
%         figure(4)
%         distancesArray(3) = distancesArray(3)+1;
%     end
%     scatter3((C_0.^n1Norm(i))./a1(i),a4(i),n1Norm(i),70,"filled",'blue'); 
%     hold on
%     scatter3((a3(i).*C_0.^n2Norm(i))./a2(i),a5(i),n2Norm(i),70,"filled",'red');
%     if n1Norm(i)>n2Norm(i)
%         plot3([(C_0^n1Norm(i))/a1(i) a3(i)*C_0^n2Norm(i)/a2(i)],[a4(i) a5(i)],[n1Norm(i) n2Norm(i)],'blue')
%     else
%         plot3([(C_0^n1Norm(i))/a1(i) a3(i)*C_0^n2Norm(i)/a2(i)],[a4(i) a5(i)],[n1Norm(i) n2Norm(i)],'red')
%     end
    %end
end
for i=1
    figure(i)
    ax = gca;
    ax.GridColor = [0 0 0];
    ax.GridAlpha = .75;
    set(gca,'YTickLabel',[]);
    set(gca,'XTickLabel',[]);
    set(gca,'ZTickLabel',[]);
    %legend('Leading','Lagging','Location','north')
    ylim([0 7])
    xlim([0 60])
    zlim([.5 2.2])
    %xlabel('On Rate / Off Rate')
    %ylabel('Carrying')
    %zlabel('Cooperativity')
    view(3)
end
distancesArray/length(a1)

LL = 0;
LT = 0;
LC = 0;
TL = 0;
TT = 0;
TC = 0;
CL = 0;
CT = 0;
CC = 0;
LeadStates = [0 0 0 0];
LaggStates = [0 0 0 0];
OutsideRange = 0;
for i=1:length(a1)
    LeadCoop = n1(i);
    LaggCoop = n2(i);
    LeadCCap = a4(i);
    LaggCCap = a5(i);
    LeadRatio = (C_0.^n1Norm(i))./a1(i);
    LaggRatio = (a3(i).*C_0.^n2Norm(i))./a2(i);
    LeadState = 1;
    LaggState = 1;
    if LeadCoop>CoopCutoff
        if LeadCCap<CCCutoff
            LeadState = 3;
        else
            LeadState = 4;
        end
    else
        if LeadCCap<CCCutoff
            LeadState = 2;
        end
    end
    if LaggCoop>CoopCutoff
        if LaggCCap<CCCutoff
            LaggState = 3;
        else
            LagState = 4;
        end
    else
        if LaggCCap<CCCutoff
            LaggState = 2;
        end
    end
    LeadStates(LeadState) = LeadStates(LeadState)+1;
    LaggStates(LaggState) = LaggStates(LaggState)+1;
    if LeadState ==4 || LaggState ==4
        OutsideRange=OutsideRange+1;
    elseif LeadState == 1
        if LaggState == 1
            LL=LL+1;
        elseif LaggState == 2
            LT=LT+1;
        elseif LaggState == 3
            LC=LC+1;
        end
    elseif LeadState == 2
        if LaggState ==1
            TL=TL+1;
        elseif LaggState ==2
            TT=TT+1;
        elseif LaggState == 3
            TC=TC+1;
        end
    else
        if LaggState ==1
            CL=CL+1;
        elseif LaggState ==2
            CT=CT+1;
        elseif LaggState == 3
            CC=CC+1;
        end
    end

end

['Outside' string(OutsideRange) string(OutsideRange/length(a1)*100);
'LL' string(LL) string(LL/length(a1)*100);
'TT' string(TT) string(TT/length(a1)*100);
'CC' string(CC) string(CC/length(a1)*100);
'LT' string(LT) string(LT/length(a1)*100);
'TL' string(TL) string(TL/length(a1)*100);
'LC' string(LC) string(LC/length(a1)*100);
'CL' string(CL) string(CL/length(a1)*100);
'TC' string(TC) string(TC/length(a1)*100);
'CT' string(CT) string(CT/length(a1)*100);]

LeadStates
LaggStates
AllStates = LeadStates+LaggStates;
AllStates