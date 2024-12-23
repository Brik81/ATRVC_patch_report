close all;

lenght_res = 0:0.1:15;
impedance = arrayfun(@calculate_slot_lenght, lenght_res);

figure;
plot(lenght_res, impedance, 'r-', 'LineWidth', 2);
hold on; 

xticks(0:1:15);
yticks(0:10:200);
xticklabels('auto');   
yticklabels('auto');  

% set grid
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

xlabel('Lenght of slots [mm]');
ylabel('Impedance [Ohms]');
title('Evaluation of Slots Lenght to Reach 50R impedance');
plot(len_50R, 50, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
xline(len_50R, 'g--', 'LineWidth', 2);
yline(50, 'b--', 'LineWidth', 2);

legend("Impedance depending on the lenght", "Point of interest with 50R and lenght 9.22mm", 'Location', 'southwest')


hold off;