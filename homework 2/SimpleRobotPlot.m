function [ Xout ] = SimpleRobotPlot( u )
%SIMPLEROBOTPLOT Summary of this function goes here

%%%%%FOLLOW THE INSTRUCTIONS GIVEN IN THE PDF FILE BEFORE STARTING THE
%%%%%IMPLEMENTATION

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
            0  q2+K2 -K3 -K4;
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

T1_W = T0_w*T1_0;
T2_W = T0_w*T2_0
T3_W = T0_w*T3_0
T4_W = T0_w*T4_0

%Compute the POSE of end-effector with respect to the world coordinate
%frame
% TODO
Xef_W=FK_robot([q1;q2;q3;q4;L1;L2;;Ln]);

%DRAW Base, Links, CFs and EF
%Use the functions from tutorial 1 to plot, joints, links, all CFs (base, end-effector) 


%% Centers of Mass
DH_table_cm = [ 0   L5/2  0    0;
               -90 -L6/2 -L7/2 0;
               -90  L10   K6   0;
                0   K7    0    0;];

% TODO: Relative Homogeneous Transformations for each CM (symbolic equations)
Tcm1_0 = DH2T(DH_table_cm(1, 1:4));		
Tcm2_1 = DH2T(DH_table_cm(2, 1:4));
Tcm3_2 = DH2T(DH_table_cm(3, 1:4));
Tcm4_3 = DH2T(DH_table_cm(4, 1:4));

% TODO: Homogeneous Transformations wrt base frame (Numeric computation)
Tcm1_0 = T1_0*Tcm1_0;
Tcm2_0 = T2_0*Tcm2_1;
Tcm3_0 = T3_0*Tcm3_2;
Tcm4_0=eye(4);


% TODO: Homogeneous Transformations wrt World frame (Numeric computation)
Tcm1_W=eye(4);
Tcm2_W=eye(4);
Tcm3_W=eye(4);
Tcm4_W=eye(4);


%DRAW CFs CMs

%TODO: Use the functions from tutoria 1 to plot CF for each center of mass
%(3 in total). Create a matlab function called plotcfs.m


%TODO: Compute the POSE of the cm 2 with respect to the robot base (CF 0) [numeric value]
Xcm2_0=zeros(6,1);

% TODO Output ONLY the position vector for end effector and cm_2 (output size 6X1) 
Xout=[Xef;Xcm2];




end

