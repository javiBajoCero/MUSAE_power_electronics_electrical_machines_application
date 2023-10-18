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
sim_time=5.9;      %[s]


%%QUIZ question 1: 0-100km/h 5,9seconds slope0%
ramp_or_constant=1;
velocityQuiz1=100;%Km/h
slope_road=0;
angle_road=atan(slope_road/100);%[tang(degrees)]

out=sim('first_model_simulink',sim_time);
fprintf('###########################################QUESTION1 (0-100)\n');
fprintf('----------aerodynamical drag:\n');
fprintf('-Peak force=%.4f [N]\n', out.aero_drag_peak_force.Data(out.aero_drag_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.aero_drag_peak_power.Data(out.aero_drag_peak_power.Length));
fprintf('-Energy=%.6f [kw/h]\n', out.aero_drag_energy.Data(out.aero_drag_energy.Length));

fprintf('----------rolling friction:\n');
fprintf('-Peak force=%.4f [N]\n', out.rolling_friction_peak_force.Data(out.rolling_friction_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.rolling_friction_peak_power.Data(out.rolling_friction_peak_power.Length));
fprintf('-Energy=%.6f [kw/h]\n', out.rolling_friction_energy.Data(out.rolling_friction_energy.Length));

fprintf('----------hill climbing:\n');
fprintf('-Peak force=%.4f [N]\n', out.hill_climbing_peak_force.Data(out.hill_climbing_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.hill_climbing_peak_power.Data(out.hill_climbing_peak_power.Length));
fprintf('-Energy=%.6f [kw/h]\n', out.hill_climbing_energy.Data(out.hill_climbing_energy.Length));

fprintf('----------m*a:\n');
fprintf('-Peak force=%.4f [N]\n', out.ma_peak_force.Data(out.ma_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.ma_peak_power.Data(out.ma_peak_power.Length));
fprintf('-Energy=%.6f [kw/h]\n', out.ma_energy.Data(out.ma_energy.Length));

fprintf('----------tractive:\n');
fprintf('-Peak force=%.4f [N]\n', out.tractive_peak_force.Data(out.tractive_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.tractive_peak_power.Data(out.tractive_peak_power.Length));
fprintf('-Energy=%.6f [kw/h]\n', out.tractive_energy.Data(out.tractive_energy.Length));

fprintf('\n');
fprintf('-total distance covered=%.4f [Km]\n', out.distanceKm.Data(out.distanceKm.Length));
fprintf('-acceleration=%.4f [m/s^2]\n', out.acceleration.Data(out.acceleration.Length));
fprintf('###########################################\n');

 %%QUIZ question 2: 0-120km/h 5,9seconds slope 0%
 ramp_or_constant=0;
 velocityQuiz1=120;%Km/h
slope_road=0;
angle_road=atan(slope_road/100);%[tang(degrees)]

 out=sim('first_model_simulink',sim_time);
fprintf('###########################################QUESTION2 (0-120)\n');
fprintf('----------aerodynamical drag:\n');
fprintf('-Peak force=%.4f [N]\n', out.aero_drag_peak_force.Data(out.aero_drag_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.aero_drag_peak_power.Data(out.aero_drag_peak_power.Length));

fprintf('----------rolling friction:\n');
fprintf('-Peak force=%.4f [N]\n', out.rolling_friction_peak_force.Data(out.rolling_friction_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.rolling_friction_peak_power.Data(out.rolling_friction_peak_power.Length));

fprintf('----------hill climbing:\n');
fprintf('-Peak force=%.4f [N]\n', out.hill_climbing_peak_force.Data(out.hill_climbing_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.hill_climbing_peak_power.Data(out.hill_climbing_peak_power.Length));

fprintf('----------m*a:\n');
fprintf('-Peak force=%.4f [N]\n', out.ma_peak_force.Data(out.ma_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.ma_peak_power.Data(out.ma_peak_power.Length));

fprintf('----------tractive:\n');
fprintf('-Peak force=%.4f [N]\n', out.tractive_peak_force.Data(out.tractive_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.tractive_peak_power.Data(out.tractive_peak_power.Length));

fprintf('\n');
fprintf('-acceleration=%.4f [m/s^2]\n', out.acceleration.Data(out.acceleration.Length));
fprintf('###########################################\n');


%%QUIZ question 3: 0-80km/h 5,9seconds slope 7,2%
ramp_or_constant=0;
velocityQuiz1=80;%Km/h
slope_road=7.2;
angle_road=atan(slope_road/100);%[tang(degrees)]
 out=sim('first_model_simulink',sim_time);
fprintf('###########################################QUESTION3 (0-80) 7,2%\n');
fprintf('----------aerodynamical drag:\n');
fprintf('-Peak force=%.4f [N]\n', out.aero_drag_peak_force.Data(out.aero_drag_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.aero_drag_peak_power.Data(out.aero_drag_peak_power.Length));

fprintf('----------rolling friction:\n');
fprintf('-Peak force=%.4f [N]\n', out.rolling_friction_peak_force.Data(out.rolling_friction_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.rolling_friction_peak_power.Data(out.rolling_friction_peak_power.Length));

fprintf('----------hill climbing:\n');
fprintf('-Peak force=%.4f [N]\n', out.hill_climbing_peak_force.Data(out.hill_climbing_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.hill_climbing_peak_power.Data(out.hill_climbing_peak_power.Length));

fprintf('----------m*a:\n');
fprintf('-Peak force=%.4f [N]\n', out.ma_peak_force.Data(out.ma_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.ma_peak_power.Data(out.ma_peak_power.Length));

fprintf('----------tractive:\n');
fprintf('-Peak force=%.4f [N]\n', out.tractive_peak_force.Data(out.tractive_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.tractive_peak_power.Data(out.tractive_peak_power.Length));

fprintf('\n');
fprintf('-acceleration=%.4f [m/s^2]\n', out.acceleration.Data(out.acceleration.Length));
fprintf('###########################################\n');

%%QUIZ question 4: 0-5km/h 5,9seconds slope 33%
ramp_or_constant=0;
velocityQuiz1=5;%Km/h
slope_road=33;
angle_road=atan(slope_road/100);%[tang(degrees)]
 out=sim('first_model_simulink',sim_time);
fprintf('###########################################QUESTION4 (0-5) 33%\n');
fprintf('----------aerodynamical drag:\n');
fprintf('-Peak force=%.4f [N]\n', out.aero_drag_peak_force.Data(out.aero_drag_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.aero_drag_peak_power.Data(out.aero_drag_peak_power.Length));

fprintf('----------rolling friction:\n');
fprintf('-Peak force=%.4f [N]\n', out.rolling_friction_peak_force.Data(out.rolling_friction_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.rolling_friction_peak_power.Data(out.rolling_friction_peak_power.Length));

fprintf('----------hill climbing:\n');
fprintf('-Peak force=%.4f [N]\n', out.hill_climbing_peak_force.Data(out.hill_climbing_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.hill_climbing_peak_power.Data(out.hill_climbing_peak_power.Length));

fprintf('----------m*a:\n');
fprintf('-Peak force=%.4f [N]\n', out.ma_peak_force.Data(out.ma_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.ma_peak_power.Data(out.ma_peak_power.Length));

fprintf('----------tractive:\n');
fprintf('-Peak force=%.4f [N]\n', out.tractive_peak_force.Data(out.tractive_peak_force.Length));
fprintf('-Peak power=%.4f [kW]\n', out.tractive_peak_power.Data(out.tractive_peak_power.Length));

fprintf('\n');
fprintf('-acceleration=%.4f [m/s^2]\n', out.acceleration.Data(out.acceleration.Length));
fprintf('###########################################\n');



