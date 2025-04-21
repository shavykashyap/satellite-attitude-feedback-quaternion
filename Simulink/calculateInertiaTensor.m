function J = calculateInertiaTensor(mass, sideLength)
    % calculateInertiaTensor calculates the moment of inertia tensor for a cube
    % Inputs:
    %   mass       - Mass of the cube (kg)
    %   sideLength - Length of each side of the cube (meters)
    %
    % Output:
    %   J          - 3x3 Moment of inertia tensor (kg*m^2)
    
    
    % Calculate the moment of inertia for each axis
    Jxx = (1/6) * mass * sideLength^2;
    
    % Since the cube is symmetrical, Ixx = Iyy = Izz
    J = diag([Jxx, Jxx, Jxx]); 
end

