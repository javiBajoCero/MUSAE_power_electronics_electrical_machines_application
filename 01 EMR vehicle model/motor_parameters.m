clc;
clear;

%%%%motor parameters
rated_power         =32000;%[w]
rated_voltage       =400;%[v]
rated_current       =89.9;%[A]
rated_speed         =2840;%[rpm]
max_speed           =6000;%[rpm]
emf_constant        =1.2396;%[Vs/rad]
winding_resistance  =0.35;%[ohms]
winding_inductance  =6.5e-3;%[mH]

%%vehicle parameters
m_v     =1000;      %[Kg] vehicle_mass
r_w     =0.26;      %[m] tire_effective_rolling_radius
k_gear  =5;         %reduction_gear
C_d     =0.35;      %drag coefficient
A_f     =2;         %[m^2]frontal area   
f_r     =0.017;     %rolling resistance coeficient
air_dens=1.22521;   %[Kg/m^3] air density
g       =9.8;       %[m/s^2] gravity constant

%sim('EMR_vehicle_model.slx',sim_time);