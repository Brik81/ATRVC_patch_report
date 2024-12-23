close all;

figure;

% set plot data
plot(FrequencyGHz_sweep, S_11dBL92mm_sweep, 'r-', 'LineWidth', 2);
hold on;

plot(FrequencyGHz_sweep, S_11dBL90mm_sweep, 'g-', 'LineWidth', 2);
plot(FrequencyGHz_sweep, S_11dBL88mm_sweep, 'b-', 'LineWidth', 2);
plot(FrequencyGHz_sweep, S_11dBL86mm_sweep, 'y-', 'LineWidth', 2);
plot(FrequencyGHz_sweep, S_11dBL84mm_sweep, 'c-', 'LineWidth', 2);
plot(FrequencyGHz_sweep, S_11dBL82mm_sweep, 'm-', 'LineWidth', 2);
plot(FrequencyGHz_sweep, S_11dBL80mm_sweep, 'Color', "#D95319", 'LineWidth', 2);
plot(FrequencyGHz_sweep, S_11dBL76mm_sweep, 'Color', '#A2142F', 'LineWidth', 2)

xlim([2.2, 3.0]);

% set ticks
xticks(1.5:0.1:3.5);
yticks(-65:5:0);
xticklabels('auto');   
yticklabels('auto');  


% set grid
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

% set titles
xlabel("Frequency [GHz]");
ylabel("S11 Parameter [dB]");
title("S11 Parameter vs Frequency Sweep to Tune for Slot Lenght");


legend('Slot Lenght 9.2mm', 'Slot Lenght 9.0mm', 'Slot Lenght 8.8mm', ...
    'Slot Lenght 8.6mm', 'Slot Lenght 8.4mm', 'Slot Lenght 8.2mm', 'Slot Lenght 8.0mm', ... 
    'Slot Lenght 7.6mm', ...
     'Location', 'southwest');

hold off;
