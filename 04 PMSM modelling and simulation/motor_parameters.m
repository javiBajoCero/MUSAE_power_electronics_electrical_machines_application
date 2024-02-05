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
lambdam=0.072;%[]
winding_resistance  =0.8e-3;%[ohms] 25 degrees
Ld  =5.4e-6;%[H]
Lq  =6.0e-6;%[H]



%%vehicle parameters
m_v     =1000;      %[Kg] vehicle_mass
r_w     =0.26;      %[m] tire_effective_rolling_radius
k_gear  =5;         %reduction_gear modificado
C_d     =0.35;      %drag coefficient
A_f     =2;         %[m^2]frontal area   
f_r     =0.017;     %rolling resistance coeficient
air_dens=1.22521;   %[Kg/m^3] air density
g       =9.8;       %[m/s^2] gravity constant
wind_speed=0;       %[m/s]



%more parameters
VDC=800;                                             %[volts]
Rbat=0.1;                                              %[Ohms]
slope_road=0;
angle_road=atan(slope_road/100);                    %[tang(degrees)]

%P speed controler
tau_speed=1.5; %from 0% to 63% in those seconds?
Kp_speed=m_v/tau_speed;
Ki_speed=0;

%PI current controler
risingtime=tau_speed/10;                        %seconds from 10% to 90%
Kp_current_d=(log(9)/risingtime)*Ld;
Ki_current_d=(log(9)/risingtime)*winding_resistance;

Kp_current_q=(log(9)/risingtime)*Lq;
Ki_current_q=(log(9)/risingtime)*winding_resistance;

Kantiwind_d=Kp_current_d;
Kantiwind_q=Kp_current_q;
upper_volt_limit=110;
lower_volt_limit=-upper_volt_limit;
converter_efficiency=0.95;                  % [%1]

upper_current_limit=400;
lower_current_limit=-upper_current_limit;
speed_slope=(100/3.6)/5.9;                  %m/s/s

sim_time=1500;%7*10;%1500;                                %seconds
sim('EMR_vehicle_model_EMRAX188.slx',sim_time);
