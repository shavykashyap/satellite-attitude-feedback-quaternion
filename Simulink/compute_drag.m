function F_drag = compute_drag(velocity, A)
    
    % A = cross-sectional area

    % coefficient of drag (constant for LEO , for altitudes between 140 and 400–600 km)
    Cd = 2.2; 

    % Atmospheric density (kg/m^3)
    rho = 4.073e-10;  

    % Magnitude of velocity (m/s)
    v = norm(velocity);  

    % Drag force (N)
    F_drag = -0.5 * rho * v^2 * Cd * A * (velocity / v);  
end
