%% Extract Data
t = out.tout;
q = out.sat_quaternion.Data;            % 4xN quaternion
omega = out.sat_angular_velocity.Data;  % 3xN angular velocity

%% Plot: Quaternion Components
figure('Color','w'); hold on;
set(gcf,'Position',[100,100,800,400]);

plot(t, q(:,1), '-', 'LineWidth', 1.8, 'Color', [0.85 0.33 0.10]); % orange-red
plot(t, q(:,2), '-', 'LineWidth', 1.8, 'Color', [0.47 0.67 0.19]); % green
plot(t, q(:,3), '-', 'LineWidth', 1.8, 'Color', [0 0.45 0.74]);    % blue
plot(t, q(:,4), '-', 'LineWidth', 1.8, 'Color', [0.3 0.3 0.3]);    % gray

xlabel('Time [s]', 'FontSize', 12);
ylabel('Quaternion Components', 'FontSize', 12);
title('Quaternion Attitude Over Time', 'FontSize', 14);
legend('$q_1$', '$q_2$', '$q_3$', '$q_4$', 'Interpreter','latex', 'FontSize', 11, 'Location','northeast');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1);
saveas(gcf, 'results/quaternion_components_pub.png');

%% Plot: Quaternion Error (4 components)
figure('Color','w'); hold on;
set(gcf,'Position',[100,100,800,400]);

plot(error.Time, error.Data(:,1), 'b', 'LineWidth', 1.8);
plot(error.Time, error.Data(:,2), 'Color', [1 0.5 0], 'LineWidth', 1.8); % orange
plot(error.Time, error.Data(:,3), 'Color', [0.5 0.5 0], 'LineWidth', 1.8); % olive
plot(error.Time, error.Data(:,4), 'm', 'LineWidth', 1.8);

xlabel('Time [s]', 'FontSize', 12);
ylabel('Quaternion Error Components', 'FontSize', 12);
title('Attitude Tracking Error', 'FontSize', 14);
legend('$e_{q_1}$', '$e_{q_2}$', '$e_{q_3}$', '$e_{q_4}$', 'Interpreter','latex', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1);
saveas(gcf, 'results/quaternion_error_pub.png');

%% Plot: Angular Velocity
figure('Color','w'); hold on;
set(gcf,'Position',[100,100,800,400]);

plot(t, omega(:,1), 'r', 'LineWidth', 1.8);
plot(t, omega(:,2), 'g', 'LineWidth', 1.8);
plot(t, omega(:,3), 'b', 'LineWidth', 1.8);

xlabel('Time [s]', 'FontSize', 12);
ylabel('Angular Velocity [rad/s]', 'FontSize', 12);
title('Angular Velocity Over Time', 'FontSize', 14);
legend('$\omega_x$', '$\omega_y$', '$\omega_z$', 'Interpreter','latex', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1);
saveas(gcf, 'results/angular_velocity_pub.png');
