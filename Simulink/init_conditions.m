clc;
clear;
close all;

%% Define Initial Conditions for the Spacecraft Dynamics

initialPosition = [3649700.0; 3308200.0; -4676600.0];  % in meters
initialVelocity = [6000; 4500; 3000];   % in meters per second 
initialAttitude = [1;0;0;0]; % initial quaternion
altitude = 800000; % Satellite altitude in meters (LEO)
initialAngularVelocity = [0; 0; 0]; % initial angular velocity
finalAttitude =  [-1/sqrt(2); 0; 0; -1/sqrt(2)]; % final quaternion
finalAngularVelocity = [0; 0; 0];% final angular velocity

%% Constant

% R_earth = 6371000; % Earth's radius in meters
% G = 6.67430e-11;  % Gravitational constant in m^3 kg^-1 s^-2
% M_earth = 5.972e24; % Earth's mass in kilograms

%% Satellite Specifications

Cross_section_area = 0.01;  % Cross-sectional area in m^2 (1U Cubesat)
mass = 1.33;                % Mass in kilograms (1U Cubesat)
sideLength = 0.1;           % Side length in meters (10 cm)

%% Time Period 

% r = R_earth + altitude; % Orbital radius (in meters)
% T_seconds = 2 * pi * sqrt(r^3 / (G * M_earth)); % Orbital period in seconds
% T_minutes = T_seconds / 60; % Orbital period in minutes
% T_hours = T_seconds / 3600; % Orbital period in hours

%% Calculate the inertia tensor

J = calculateInertiaTensor(mass, sideLength);           % Spacecraft Inertia Matrix

%% Geographical Point of Interest (Seattle)
 
lat = 47.61;  % Latitude in degrees
long = -122.33;  % Longitude in degrees
alt = 57;  % Altitude in meters

vec = [lat,long,alt];

%% Controller​

k = 0.32;
d = 0.8;