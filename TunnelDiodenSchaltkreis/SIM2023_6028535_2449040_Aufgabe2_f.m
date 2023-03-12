function x_dot = SIM2023_6028535_2449040_Aufgabe2_f(t, x)
    % Constants
    R = 1500; % in Ohm
    C = 2e-12; % in F
    L = 5e-6; % in H
    u = 1.2; % in V

    vC = x(1);
    iL = x(2);
    h = SIM2023_6028535_2449040_Aufgabe2_h(vC);

    x_dot = [(-h + iL) / C; (-vC - R * iL + u) / L];
end

