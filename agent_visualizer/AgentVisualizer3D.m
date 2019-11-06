classdef AgentVisualizer3D < AgentVisualizerBase
    properties (SetAccess = protected)
    end
    methods
        function obj = AgentVisualizer3D(args)
            obj@AgentVisualizerBase(args);
            obj.position = zeros(3, args.memory_size);
        end
        function visualizeSpacecraftPosition(this, stamp, symbol, b_filled)
            position_at_stamp = this.position(:,stamp);
            if b_filled
                scatter3(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), symbol, 'filled')
            else
                scatter3(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), symbol)
            end
            hold on
        end
        function visualizePositionDifference(this1, this2, stamp, symbol)
            x_vector = [this1.position(1, stamp), this2.position(1, stamp)];
            y_vector = [this1.position(2, stamp), this2.position(2, stamp)];
            z_vector = [this1.position(3, stamp), this2.position(3, stamp)];
            plot3(x_vector, y_vector, z_vector, symbol);
            hold on
        end
    end
end