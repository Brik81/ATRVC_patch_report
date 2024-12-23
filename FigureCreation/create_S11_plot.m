close all;

figure;

% set plot data
plot(FrequencyGHz, S_11DB, 'r-', 'LineWidth', 2);
hold on;

% set ticks
xticks(1.5:0.1:3.5);
yticks(-9:1:0);
xticklabels('auto');   
yticklabels('auto');  

% set grid
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

% set titles
xlabel("Frequency [GHz]");
ylabel("S11 Parameter [dB]");
title("S11 Parameter vs Frequency with no optimization");



xline(2.6, 'g--', 'LineWidth', 2);
xline(2.548, 'b--', 'LineWidth', 2);

plot(2.6, -7.5924, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(2.548, -9.5315, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

legend('S11 Simulated Parameter', 'Nominal 2.6GHz Frequency', ...
    'Minimum 2.548GHz Frequency', 'S11 Nominal Value = -7.5924dB', ...
    'S11 Minimum Value = -9.5315dB', 'Location', 'southwest');

hold off;

figure; 
plot(FrequencyGHz, ZRealOhm, 'r-', 'LineWidth', 2);
hold on;
plot(FrequencyGHz, ZImaginaryOhm, 'r--', 'LineWidth', 2);

xticks(1.5:0.1:3.5);
yticks(-250:50:150);
xticklabels('auto');   
yticklabels('auto'); 
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

freq_50R = interp1(ZRealOhm, FrequencyGHz, 50, "linear");
val_50R_img = interp1(FrequencyGHz, ZImaginaryOhm, freq_50R, "linear");
val_2G6_real = interp1(FrequencyGHz, ZRealOhm, 2.6, "linear");
val_2G6_img = interp1(FrequencyGHz, ZImaginaryOhm, 2.6, "linear");

xline(2.6, 'g--', 'LineWidth', 2);
xline(freq_50R, 'b--', 'LineWidth', 2);

plot(2.6, val_2G6_real, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(2.6, val_2G6_img, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
% plot(freq_50R, 50, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
% plot(freq_50R, val_50R_img, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

xlabel("Frequency [GHz]");
ylabel("Z Impedace [Ohms]");
title("Z Impedance vs Frequency with no optimization");

legend('Z Real Simulated Impedance', 'Z Imaginary Simulated Impedance', ...
    'Nominal 2.6GHz Frequency', ...
    'Target 50R Frequency', 'Nominal Frequency: 71.85-50.78j', ...
     'Location', 'southwest');

hold off;



