% function [DLn,cityn]=tsp(n)
%  
% if n==10
%     city10=[0.4 0.4439;0.2439 0.1463;0.1707 0.2293;0.2293 0.761;0.5171 0.9414;
%     0.8732 0.6536;0.6878 0.5219;0.8488 0.3609;0.6683 0.2536;0.6195 0.2634];%10 cities d'=2.691
%     for i=1:10
%         for j=1:10
%             DL10(i,j)=((city10(i,1)-city10(j,1))^2+(city10(i,2)-city10(j,2))^2)^0.5;
%         end
%     end
%     DLn=DL10;
%     cityn=city10;
% end
function [DLn,cityn]=tsp(n)
  
if n==30
    city30=[41 94;37 84;54 67;25 62;7 64;2 99;68 58;71 44;54 62;83 69;64 60;18 54;22 60;
        83 46;91 38;25 38;24 42;58 69;71 71;74 78;87 76;18 40;13 40;82 7;62 32;58 35;45 21;41 26;44 35;4 50];%30 cities d'=423.741 by D B Fogel
    for i=1:30
        for j=1:30
            DL30(i,j)=((city30(i,1)-city30(j,1))^2+(city30(i,2)-city30(j,2))^2)^0.5;
        end
    end
    DLn=DL30;
    cityn=city30;
end
 
if n==50
    city50=[31 32;32 39;40 30;37 69;27 68;37 52;38 46;31 62;30 48;21 47;25 55;16 57;
        17 63;42 41;17 33;25 32;5 64;8 52;12 42;7 38;5 25; 10 77;45 35;42 57;32 22;
        27 23;56 37;52 41;49 49;58 48;57 58;39 10;46 10;59 15;51 21;48 28;52 33;
        58 27;61 33;62 63;20 26;5 6;13 13;21 10;30 15;36 16;62 42;63 69;52 64;43 67];%50 cities d'=427.855 by D B Fogel
    for i=1:50
        for j=1:50
            DL50(i,j)=((city50(i,1)-city50(j,1))^2+(city50(i,2)-city50(j,2))^2)^0.5;
        end
    end
    DLn=DL50;
    cityn=city50;
end
 
if n==75
    city75=[48 21;52 26;55 50;50 50;41 46;51 42;55 45;38 33;33 34;45 35;40 37;50 30;
        55 34;54 38;26 13;15 5;21 48;29 39;33 44;15 19;16 19;12 17;50 40;22 53;21 36;
        20 30;26 29;40 20;36 26;62 48;67 41;62 35;65 27;62 24;55 20;35 51;30 50;
        45 42;21 45;36 6;6 25;11 28;26 59;30 60;22 22;27 24;30 20;35 16;54 10;50 15;
        44 13;35 60;40 60;40 66;31 76;47 66;50 70;57 72;55 65;2 38;7 43;9 56;15 56;
        10 70;17 64;55 57;62 57;70 64;64 4;59 5;50 4;60 15;66 14;66 8;43 26];%75 cities d'=549.18 by D B Fogel
    for i=1:75
        for j=1:75
            DL75(i,j)=((city75(i,1)-city75(j,1))^2+(city75(i,2)-city75(j,2))^2)^0.5;
        end
    end
    DLn=DL75;
    cityn=city75;
end
