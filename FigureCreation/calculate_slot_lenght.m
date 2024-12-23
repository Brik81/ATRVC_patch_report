function imp = calculate_slot_lenght(len)
    G1 = 0.002604694;
    imp = 1 / (2 * G1) * (cos(pi / 28.0 * len))^2;
end
