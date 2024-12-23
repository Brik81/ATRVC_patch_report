close all;

figure;

% set plot data
plot(FrequencyGHz_slots, S_11DB_slots, 'r-', 'LineWidth', 2);
hold on;

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
title("S11 Parameter vs Frequency with slots");

[s11_db_min, s11_db_min_index] = min(S_11DB_slots);
s11_db_min_freq = FrequencyGHz_slots(s11_db_min_index);

xline(2.6, 'g--', 'LineWidth', 2);
xline(s11_db_min_freq, 'b--', 'LineWidth', 2);

s11_db_nom = interp1(FrequencyGHz_slots, S_11DB_slots, 2.6, "linear");

plot(2.6, s11_db_nom, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(s11_db_min_freq, s11_db_min, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

legend('S11 Simulated Parameter', 'Nominal 2.6GHz Frequency', ...
    'Minimum 2.588GHz Frequency', 'S11 Nominal Value = -20.7949dB', ...
    'S11 Minimum Value = -63.0562dB', 'Location', 'southwest');

hold off;

figure; 
plot(FrequencyGHz_slots, ZRealOhm_slots, 'r-', 'LineWidth', 2);
hold on;
plot(FrequencyGHz, ZImaginaryOhm_slots, 'r--', 'LineWidth', 2);

xticks(1.5:0.1:3.5);
yticks(-250:50:150);
xticklabels('auto');   
yticklabels('auto'); 
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

freq_50R = interp1(ZRealOhm_slots, FrequencyGHz_slots, 50, "linear");
val_50R_img = interp1(FrequencyGHz_slots, ZImaginaryOhm_slots, freq_50R, "linear");
val_2G6_real = interp1(FrequencyGHz_slots, ZRealOhm_slots, 2.6, "linear");
val_2G6_img = interp1(FrequencyGHz_slots, ZImaginaryOhm_slots, 2.6, "linear");

xline(2.6, 'g--', 'LineWidth', 2);
xline(freq_50R, 'b--', 'LineWidth', 2);

plot(2.6, val_2G6_real, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(freq_50R, 50, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
plot(2.6, val_2G6_img, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(freq_50R, val_50R_img, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

xlabel("Frequency [GHz]");
ylabel("Z Impedace [Ohms]");
title("Z Impedance vs Frequency with slots");

legend('Z Real Simulated Impedance', 'Z Imaginary Simulated Impedance', ...
    'Nominal 2.6GHz Frequency', ...
    'Target 50R Frequency', 'Nominal Frequency: 47.78-8.63j', ...
     'Target 50R Frequency: 50R+2.98j',...
     'Location', 'southwest');

hold off;

figure;

plot(FrequencyGHz_slots, VSVR_slots, 'r-', 'LineWidth', 2);
hold on; 

ylim([0, 30]);
xticks(1.5:0.1:3.5);
yticks(0:10:60);
xticklabels('auto');   
yticklabels('auto'); 
grid on;

yline(2, 'k--', 'LineWidth', 2);

xline(2.6, 'g--', 'LineWidth', 2);
val_2G6_vsvr = interp1(FrequencyGHz_slots, VSVR_slots, 2.6, "linear");
plot(2.6, val_2G6_vsvr, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');

xlabel("Frequency [GHz]");
ylabel("VSWR");
title("VSWR vs Frequency with slots");

legend('VSWR Simulated Value', 'Specification Limit', ...
    'Nominal 2.6GHz Frequency', ...
    'VSWR Value at Nominal Frequency: 1.2', ...
     'Location', 'northeast');
hold off;


