close all;

figure;

% set plot data
plot(FrequencyGHz_real, S11dB_real, 'r-', 'LineWidth', 2);
hold on;

% set ticks
xticks(1.5:0.1:3.5);
yticks(-20:2:0);
xticklabels('auto');   
yticklabels('auto');  

% set grid
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

% set titles
xlabel("Frequency [GHz]");
ylabel("S11 Parameter [dB]");
title("S11 Parameter vs Frequency from Real Data");

s11_2G6_val = interp1(FrequencyGHz_real, S11dB_real, 2.6, "linear");
[s11_min_val, s11_min_index] = min(S11dB_real);
s11_freq_val = FrequencyGHz_real(s11_min_index);

xline(2.6, 'g--', 'LineWidth', 2);
xline(s11_freq_val, 'b--', 'LineWidth', 2);

plot(2.6, s11_2G6_val, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(s11_freq_val, s11_min_val, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

legend('S11 Real Data', 'Nominal 2.6GHz Frequency', ...
    'Minimum 2.62GHz Frequency', 'S11 Nominal Value = -13.0157dB', ...
    'S11 Minimum Value = -15.0535dB', 'Location', 'southwest');

hold off;

figure; 
plot(FrequencyGHz_real, ZRealOhms_real, 'r-', 'LineWidth', 2);
hold on;
plot(FrequencyGHz_real, ZImaginaryOhms_real, 'r--', 'LineWidth', 2);

xlim([2.0, 3.2]);
xticks(1.5:0.1:3.5);
yticks(-250:25:150);
xticklabels('auto');   
yticklabels('auto'); 
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.6);

%freq_50R = interp1(ZRealOhm, FrequencyGHz, 50, "linear");
%val_50R_img = interp1(FrequencyGHz, ZImaginaryOhm, freq_50R, "linear");
val_2G6_real = interp1(FrequencyGHz_real, ZRealOhms_real, 2.6, "linear");
val_2G6_img = interp1(FrequencyGHz_real, ZImaginaryOhms_real, 2.6, "linear");

xline(2.6, 'g--', 'LineWidth', 2);
%xline(freq_50R, 'b--', 'LineWidth', 2);

plot(2.6, val_2G6_real, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(2.6, val_2G6_img, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
% plot(freq_50R, 50, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
% plot(freq_50R, val_50R_img, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

xlabel("Frequency [GHz]");
ylabel("Z Impedace [Ohms]");
title("Z Impedance vs Frequency from Real Data");

legend('Z Real Real Data Impedance', 'Z Imaginary Real Data Impedance', ...
    'Nominal 2.6GHz Frequency', ...
    'Nominal Frequency: 50.14+20.03j', ...
     'Location', 'southwest');

hold off;



