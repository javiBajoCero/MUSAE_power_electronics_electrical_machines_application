clc;
clear;

%%%%motor parameters EMRAX 188
polepairs=10;
polenumber=2*polepairs;
rated_power         =23000;%[w]
rated_voltage       =110;%[vdc]
rated_current       =400;%[Arms]
rated_speed         =6500;%[rpm] no field weakening
max_speed           =8000;%[rpm] for few seconds with field weakening
lambdam=0.008;%[]
emf_constant        =lambdam*polepairs;     %1.2396;%[Vs/rad]
winding_resistance  =0.8e-3;%[ohms] 25 degrees
Ld  =5.4e-6;%[H]
Lq  =6.0e-6;%[H]



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
VDC=110;                                             %[volts]
Rbat=0.1;                                              %[Ohms]
slope_road=0;
angle_road=atan(slope_road/100);                    %[tang(degrees)]

%P speed controler
tau_speed=0.3;                                      %seconds
Kp_speed=m_v/tau_speed;
Ki_speed=0;

%PI current controler
risingtime=0.03;                                     %seconds , arbitrary number 
Kp_current_d=(log(9)/risingtime)*Ld;
Ki_current_d=(log(9)/risingtime)*winding_resistance;

Kp_current_q=(log(9)/risingtime)*Lq;
Ki_current_q=(log(9)/risingtime)*winding_resistance;


converter_efficiency=0.95;                  % [%1]

speed_slope=(100/3.6)/5.9;                  %m/s/s

sim_time=1500;                                %seconds
sim('EMR_vehicle_model.slx',sim_time);
