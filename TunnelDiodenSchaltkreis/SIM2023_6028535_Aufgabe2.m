clear;

deltaT = 10e-12;
tInv = 0:deltaT:30e-9;

vC = linspace(-0.5, 1.5, 20);
iL = linspace(-0.5, 1.5, 20);
ys = cell(length(vC), length(iL), 2);

for vCIdx = 1:length(vC)
    for iLIdx = 1:length(iL)
        x0 = [vC(vCIdx); iL(iLIdx)];
        [t, y] = ode45(@SIM2023_6028535_Aufgabe2_f, tInv, x0);
        ys{vCIdx, iLIdx, 1} = t;
        ys{vCIdx, iLIdx, 2} = y;
    end
end

vC2 = transpose(-0.1:0.01:1.1);
h = zeros(size(vC2));
g = zeros(size(vC2));

for i = 1:length(vC2)
    h(i) = SIM2023_6028535_Aufgabe2_h(vC2(i));
    g(i) = SIM2023_6028535_Aufgabe2_g(vC2(i));
end
first = 0;
second = 1;
third = 2;
for vCIdx = 1:length(vC)
    for iLIdx = 1:length(iL)
        t = ys{vCIdx,iLIdx,1};
        y = ys{vCIdx,iLIdx,2};
        vCEqui = y(length(y), 1);
        if vCEqui < 0.1
            disp("first");
            first = max([first, vCEqui]);
        elseif vCEqui < 0.8
            disp("second");
            second = max([second, vCEqui]);
        else
            disp("third");
            third = min([third, vCEqui]);
        end
        subplot(2,2,1), hold on;
        plot(t, y(:,1)), hold on;
        subplot(2,2,2), hold on;
        plot(t,y(:,2)), hold on;
        subplot(2,2,3), hold on;
        plot(y(:,1), y(:,2)), hold on;
        plot(y(1,1), y(1,2), 'o'), hold on;
    end
end


subplot(2,2,4), hold on;
plot(vC2, g), hold on;
plot(vC2, h), hold on;
hold off;