load slamRobotTrajectory.mat

w = vrworld('slamSimulatedWorld.x3d');
open(w)

vrf = vrfigure(w)

robotVRNode = vrnode(w,'Robot');

Set the initial position of the robot from the trajectory first point and set initial rotation is set to 0 rad about y axis.

robotVRNode.children.translation = [trajectory(1,1) 0 trajectory(1,2)];
robotVRNode.children.rotation = [0 1 0 0];

lidarVRNode = vrnode(w,'LIDAR_Sensor');

angles  = 180:-1.5:-178.5;
angles = deg2rad(angles)';

pause(1)

maxLidarRange = 8;
mapResolution = 20;
slamAlg = robotics.LidarSLAM(mapResolution, maxLidarRange);

slamAlg.LoopClosureThreshold = 200;
slamAlg.LoopClosureSearchRadius = 3;
controlRate = robotics.Rate(10);

firstLoopClosure = false;
scans = cell(length(trajectory),1);

figure
for i=1:length(trajectory)
    % Use translation property to move the robot. 
    robotVRNode.children.translation = [trajectory(i,1) 0 trajectory(i,2)];
    vrdrawnow;
    
    % Read the range readings obtained from lidar sensor of the robot.
    range = lidarVRNode.pickedRange;
    
    % The simulated lidar readings will give -1 values if the objects are
    % out of range. Make all these value to the greater than
    % maxLidarRange.
    range(range==-1) = maxLidarRange+2;

    % Create a |lidarScan| object from the ranges and angles. 
    scans{i} = lidarScan(range,angles);
    
    [isScanAccepted, loopClosureInfo, optimizationInfo] = addScan(slamAlg, scans{i});
    if isScanAccepted
        % Visualize how scans plot and poses are updated as robot navigates
        % through virtual scene
        show(slamAlg);
        
        % Visualize the first detected loop closure
        % firstLoopClosure flag is used to capture the first loop closure event
        if optimizationInfo.IsPerformed && ~firstLoopClosure
            firstLoopClosure = true;
            show(slamAlg, 'Poses', 'off');
            hold on;
            show(slamAlg.PoseGraph);
            hold off;
            title('First loop closure');
            snapnow
        end
    end

    waitfor(controlRate);
end

show(slamAlg, 'Poses', 'off');
hold on
show(slamAlg.PoseGraph); 
hold off
title({'Final Built Map of the Environment', 'Trajectory of the Robot'});

[scans, optimizedPoses]  = scansAndPoses(slamAlg);
map = buildMap(scans, optimizedPoses, mapResolution, maxLidarRange);

figure; 
show(map);
hold on
show(slamAlg.PoseGraph, 'IDs', 'off');
hold off
title('Occupancy Grid Map Built Using Lidar SLAM');

close(vrf);
close(w);
delete(w);