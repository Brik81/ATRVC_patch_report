close all;

figure; 

polarplot(Angledeg/360*2*pi, HorizzontalS21dB, 'r-', 'LineWidth', 2);
hold on;

%polarplot(Angledeg/360*2*pi, VerticalDirectivitydB - 36.89893, 'b-', 'LineWidth', 2); 

rlim([-90, -20]); 
rticks(-90:10:-20);

title("S12 [dB] Radiation Pattern E-Plane");
legend('Measured Radiation Pattern', 'Simulated Radiation Pattern', 'Location','southwestoutside');

grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);


hold off; 

figure;
polarplot(Angledeg/360*2*pi, VerticalS21dB, 'r-', 'LineWidth', 2);
hold on;

title("S12 [dB] Radiation Pattern H-Plane");


rlim([-60, -20]); 
rticks(-60:10:-20);

%polarplot(Angledeg/360*2*pi, HorizzontalDirectivitydB - 36.89893, 'b-', 'LineWidth', 2); 

legend('Measured Radiation Pattern', 'Simulated Radiation Pattern', 'Location','southwestoutside');
%rlim([-80, 10]); 
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

hold off;