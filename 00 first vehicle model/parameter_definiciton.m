%%%https://atenea.upc.edu/pluginfile.php/5561177/mod_resource/content/1/02_Lab2_ElectricPropulsionSystems_PE%20and%20EM%20app%20mobility%20and%20industry_R1_2021_08.pdf
clc;
clear;

%%%%vehicle parameters
m_v     =1000;      %[Kg] vehicle_mass
r_w     =0.26;      %[m] tire_effective_rolling_radius
k_gear  =5;         %reduction_gear
C_d     =0.35;      %drag coefficient
A_f     =2;         %[m^2]frontal area   
f_r     =0.017;     %rolling resistance coeficient
air_dens=1.22521;   %[Kg/m^3] air density
g       =9.8;       %[m/s^2] gravity constant
wind_speed=0;       %[m/s]
sim_time=1220;      %[s]

slope_road=0;       %[%]
angle_road=atan(slope_road/100);%[tang(degrees)]

sim('first_model_simulink',sim_time);