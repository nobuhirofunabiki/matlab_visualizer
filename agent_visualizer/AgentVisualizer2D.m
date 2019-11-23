classdef AgentVisualizer2D < AgentVisualizerBase
    properties (SetAccess = protected)
    end
    methods
        function obj = AgentVisualizer2D(args)
            obj@AgentVisualizerBase(args);
            obj.position = zeros(2, args.memory_size);
        end
        function visualizeAgentTrajectory(this, symbol)
            plot(this.position(1,:), this.position(2,:), symbol);
            hold on
        end
        function visualizeAgentTrajectoryCustomized(this, args)
            line_color = args.line_color;
            line_style = args.line_style;
            line_width = args.line_width;
            plot (this.position(1,:), this.position(2,:), ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
            hold on
        end
        function visualizeAgentPosition(this, stamp, symbol, b_filled)
            position_at_stamp = this.position(:,stamp);
            if b_filled
                scatter(position_at_stamp(1,:), position_at_stamp(2,:), symbol, 'filled')
            else
                scatter(position_at_stamp(1,:), position_at_stamp(2,:), symbol)
            end
            hold on
        end
        function visualizeAgentPositionCustomized(this, stamp, args)
            txt = args.txt;
            marker_symbol = args.marker_symbol;
            marker_size = args.marker_size;
            marker_edge_color = args.marker_edge_color;
            marker_face_color = args.marker_face_color;
            position_at_stamp = this.position(:,stamp);
            scatter(position_at_stamp(1,:), position_at_stamp(2,:), ...
                'Marker', marker_symbol, ...
                'SizeData', marker_size, ...
                'MarkerEdgeColor', marker_edge_color, ...
                'MarkerFaceColor', marker_face_color)
            hold on
            txt = ['  ', txt];
            text(position_at_stamp(1,:), position_at_stamp(2,:), txt)
        end
        function visualizeAgentPositionWithText(this, stamp, symbol, b_filled, txt)
            position_at_stamp = this.position(:,stamp);
            if b_filled
                scatter(position_at_stamp(1,:), position_at_stamp(2,:), symbol, 'filled')
            else
                scatter(position_at_stamp(1,:), position_at_stamp(2,:), symbol)
            end
            hold on
            % TODO
            txt = ['  ', txt];
            text(position_at_stamp(1,:), position_at_stamp(2,:), txt)
        end
        function visualizePositionDifference(this1, this2, stamp, symbol)
            x_vector = [this1.position(1, stamp), this2.position(1, stamp)];
            y_vector = [this1.position(2, stamp), this2.position(2, stamp)];
            plot(x_vector, y_vector, symbol);
            hold on
        end
    end
end