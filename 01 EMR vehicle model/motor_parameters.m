clc;
clear;

%%%%motor parameters
rated_power         =32000;%[w]
rated_voltage       =400;%[v]
rated_current       =89.5;%[A]
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
wind_speed=0;       %[m/s]


%more parameters
VDC=400;                                             %[volts]
Rbat=0.1;                                              %[Ohms]
slope_road=0;
angle_road=atan(slope_road/100);                    %[tang(degrees)]

%P speed controler
tau_speed=0.3;                                      %seconds
Kp_speed=m_v/tau_speed;
Ki_speed=0;

%PI current controler
risingtime=0.03;                                     %seconds , arbitrary number 
Kp_current=(log(9)/risingtime)*winding_inductance;
Ki_current=(log(9)/risingtime)*winding_resistance;
Kantiwind=Kp_current;

upper_current_limit=rated_current;                   % [Amps]
lower_current_limit=-upper_current_limit;   % [Amps]
upper_volt_limit=rated_voltage;                       % [Volts]
lower_volt_limit=-upper_volt_limit;         % [Volts]

converter_efficiency=0.95;                  % [%1]

speed_slope=(100/3.6)/5.9;                  %m/s/s

sim_time=1500;                                %seconds
%sim('EMR_vehicle_model.slx',sim_time);



fprintf('###########################################quiz 2 question1\n');
fprintf('----------Supposing that the maximum current in the motor is limited by its rated value, which is the maximum torque of the motor?:\n');
fprintf('-(analytically) max T=%.4f [N m]\n', emf_constant*rated_current);
fprintf('----------Neglecting the rolling friction and the aerodynamical drag, and supposing a slope of the road to be 0, compute now the maximum acceleration of the vehicle:\n');
fprintf('-(analytically) max a=%.4f [m/s2]\n', ((emf_constant*rated_current)*k_gear/r_w)/m_v );
fprintf('###########################################quiz 2 question 2\n');
fprintf('----------Supposing that the maximum voltage you can apply to the motor is limited by its rated value, which is the maximum rotating speed of the motor?:\n');
fprintf('-(analytically) max ωm=%.4f [rad/s]\n', rated_voltage/emf_constant);
fprintf('----------Neglecting the rolling friction and the aerodynamical drag, and supposing a slope of the road to be 0, compute now the maximum speed of the vehicle:\n');
fprintf('-(analytically) max v=%.4f [km/h]\n', (rated_voltage/emf_constant)*r_w*3.6/k_gear);