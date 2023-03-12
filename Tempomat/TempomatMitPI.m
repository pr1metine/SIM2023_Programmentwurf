% Tempomat

%% Simulationsparameter
dtSim = 0.01;  % s, Schrittweite Simulation
tEnd  = 4000;  % s, Simulationsdauer

%% Parameter für Streckenmodell
cR  = 0.013;  % Rollwiderstandsbeiwert
cW  = 0.28;   % Luftwiderstandsbeiwert
rho = 1.21;   % kg/m3, Luftdichte
A   = 2;      % m2, Referenzfläche für Luftwiderstand
m   = 1500;   % kg, Fahrzeugmasse
g   = 9.81;   % m/s2, Fallbeschleunigung

%% Anfangsbedingungen
v0 = 0; % m/s, Geschwindigkeit zum Zeitpunkt t=0

%% Parameter für Regler u = KP * (1 + 1/(TI*s)) = KP + KI/s
KP = 20; % Ns/m, Regler P-Verstärkung
TI = 60; % s, Regler TI-Zeitkonstante

