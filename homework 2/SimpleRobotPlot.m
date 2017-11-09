function [ Xout ] = SimpleRobotPlot( u )
%SIMPLEROBOTPLOT Summary of this function goes here

%%%%%FOLLOW THE INSTRUCTIONS GIVEN IN THE PDF FILE BEFORE STARTING THE
%%%%%IMPLEMENTATION







%Due to not asking questions, I could not figure out how to do the
%exercises. This is completely my own fault. 







%Joint Position (NOT NEEDED IN THIS TUTORIAL)
qp1=u(1);
qp2=u(2);
qp3=u(3);
qp4=u(4);

%Joint Velocity
q1=u(5);
q2=u(6);
q3=u(7);
q4=u(8);

%Time
t=u(9);

%Kinematic Parameters
L1=u(10);
L2=u(11);
L3=u(12);
L4=u(13);
L5=u(14);
L6=u(15);
L7=u(16);
L8=u(17);
L9=u(18);
L10=u(19);
L11=u(20);
L12=u(21);
c=u(22);
d=u(23);
theta1=u(24);
theta2=u(25);

%combine variables to simplify DH-table
K1=L5+L6;
K2=L7+L8+L9*sin(theta2);
K3=L9*cos(theta2);
K4=90+theta1;
K5=L10+L11;
K6=L10*tan(theta1);
K7=L12+c/2;
K8=atan2(L10/cos(theta1), L9*cos(theta2));
K9=L10/(cos(theta1)*sin(K8));
K10=L10 + L11 + (L12+c/2)/cos(theta1);
K11 = (L12+c/2)/sin(theta1);

% ...
% TODO: add as many variable as needed, according to the robot parameters.

% L1...L12 c d theta1...theta2


%% Joints and End-effector
% TODO: DEFINE THE Robot Base SEE FIG.6 
T0_W = [1 0  0 L1;
        0 0 -1 L2;
        0 1  0 L3;
        0 0  0 1];
T0_W = T0_W * [0 -1 0 0;
               1  0 0 0;
               0  0 1 0;
               0  0 0 1];

% TODO: DEFINE THE Relative Homogeneous Transformations (symbolic form)
DH_table = [q1 L4     0  -90;
            90 q2+K1  0  -90;
            0  q3+K2 -K3 -K4;
            q4 K5     0   theta1;];
       
T1_0 = DH2T(DH_table(1, 1:4));
				
T2_1 = DH2T(DH_table(2, 1:4));
				
T3_2 = DH2T(DH_table(3, 1:4));

T4_3 = DH2T(DH_table(4, 1:4));





% TODO: DEFINE Homogeneous Transformations wrt BASE frame (Numeric computation)

T1_0 = T1_0;
T2_0 = T1_0*T2_1;
T3_0 = T2_0*T3_2;
T4_0 = T3_0*T4_3;


% TODO: DEFINE Homogeneous Transformations wrt WORLD frame (Numeric computation)

T1_W = T0_W*T1_0;
T2_W = T0_W*T2_0;
T3_W = T0_W*T3_0;
T4_W = T0_W*T4_0;

%Compute the POSE of end-effector with respect to the world coordinate
%frame
% TODO

Xef_W=FK_robot([q1;q2;q3;q4;L1;L2;L3]);

%DRAW Base, Links, CFs and EF
%Use the functions from tutorial 1 to plot, joints, links, all CFs (base, end-effector) 
%figure(1);
plot_T(T1_0);

%% Centers of Mass
DH_table_cm = [q1+90 L4    L5/2 0;
               0     q2+K1 L7/2 0;
               -K8   q3+K2 -K9  0;
               q4+90 K10   -K11 0];

% TODO: Relative Homogeneous Transformations for each CM (symbolic equations)
Tcm1_0 = DH2T(DH_table_cm(1, 1:4));		
Tcm2_1 = DH2T(DH_table_cm(2, 1:4));
Tcm3_2 = DH2T(DH_table_cm(3, 1:4));
Tcm4_3 = DH2T(DH_table_cm(4, 1:4));

% TODO: Homogeneous Transformations wrt base frame (Numeric computation)
Tcm1_0 = T1_0*Tcm1_0;
Tcm2_0 = T1_0*Tcm2_1;
Tcm3_0 = T2_0*Tcm3_2;
Tcm4_0 = T3_0*Tcm4_3;


% TODO: Homogeneous Transformations wrt World frame (Numeric computation)
Tcm1_W = T0_W*Tcm1_0;
Tcm2_W = T0_W*Tcm2_0;
Tcm3_W = T0_W*Tcm3_0;
Tcm4_W = T0_W*Tcm4_0;


%DRAW CFs CMs

%TODO: Use the functions from tutoria 1 to plot CF for each center of mass
%(3 in total). Create a matlab function called plotcfs.m


%TODO: Compute the POSE of the cm 2 with respect to the robot base (CF 0) [numeric value]
Xcm2_0=zeros(6,1);


Xef = [0 0 0];
Xcm2 = [0 0 0];
% TODO Output ONLY the position vector for end effector and cm_2 (output size 6X1) 
Xout=[Xef;Xcm2];



end

