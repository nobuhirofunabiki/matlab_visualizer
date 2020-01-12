classdef AgentVisualizer3D < AgentVisualizerBase
    properties (SetAccess = protected)
    end

    methods (Access = public)
        function obj = AgentVisualizer3D(args)
            obj@AgentVisualizerBase(args);
            obj.position = zeros(3, args.memory_size);
        end

        function output = visualizeAgentTrajectory(this, symbol)
            output = plot3(this.position(1,:), this.position(2,:), this.position(3,:), symbol);
            hold on
        end

        function output = visualizeAgentTrajectoryCustomized(this, args)
            line_color = args.line_color;
            line_style = args.line_style;
            line_width = args.line_width;
            hold on
            output = plot3(this.position(1,:), this.position(2,:), this.position(3,:), ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
        end

        function output = visualizeAgentPosition(this, stamp, symbol, b_filled)
            position_at_stamp = this.position(:,stamp);
            if b_filled
                output = scatter3(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), symbol, 'filled');
            else
                output = scatter3(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), symbol);
            end
            hold on
        end

        function output = visualizeAgentPositionCustomized(this, stamp, args)
            txt = args.txt;
            marker_symbol = args.marker_symbol;
            marker_size = args.marker_size;
            marker_edge_color = args.marker_edge_color;
            marker_face_color = args.marker_face_color;
            position_at_stamp = this.position(:,stamp);
            output = scatter3(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), ...
                'Marker', marker_symbol, ...
                'SizeData', marker_size, ...
                'MarkerEdgeColor', marker_edge_color, ...
                'MarkerFaceColor', marker_face_color);
            hold on
            txt = ['  ', txt];
            text(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), txt);
        end

        function output = visualizeAgentPositionWithText(this, stamp, symbol, b_filled, txt)
            position_at_stamp = this.position(:,stamp);
            if b_filled
                output = scatter3(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), symbol, 'filled');
            else
                output = scatter3(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), symbol);
            end
            hold on
            % TODO
            txt = ['  ', txt];
            text(position_at_stamp(1,:), position_at_stamp(2,:), position_at_stamp(3,:), txt);
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