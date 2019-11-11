classdef MultiAgentVisualizer2D < MultiAgentVisualizerBase
    properties (SetAccess = protected)
    end
    methods
        function obj = MultiAgentVisualizer2D(args)
            num_agents = args.num_agents;
            args_visualizer.memory_size = args.memory_size;
            for iAgents = 1:num_agents
                visualizers(iAgents) = AgentVisualizer2D(args_visualizer);
            end
            obj.visualizers = visualizers;
        end

        % Visualzation (Pass-through functions to AgentVisualizer2D)
        function visualizeAgentTrajectory(this, iAgents, symbol)
            this.visualizers(iAgents).visualizeAgentTrajectory(symbol);
        end
        function visualizeAgentTrajectoryCustomized(this, iAgents, args)
            this.visualizers(iAgents).visualizeAgentTrajectoryCustomized(args);
        end
        function visualizeAgentPosition(this, iAgents, stamp, symbol, b_filled)
            this.visualizers(iAgents).visualizeAgentPosition(...
                stamp, symbol, b_filled);
        end
        function visualizeAgentPositionCustomized(this, iAgents, stamp, args)
            this.visualizers(iAgents).visualizeAgentPositionCustomized(stamp, args);
        end
        function visualizeAgentPositionWithText(this, iAgents, stamp, symbol, b_filled, txt)
            this.visualizers(iAgents).visualizeAgentPositionWithText(...
                stamp, symbol, b_filled, txt);
        end
        % Setters (Pass-through functions to AgentVisualizer2D)
        function setTimeList(this, iAgents, time_stamp, iMem)
            this.visualizers(iAgents).setTimeList(time_stamp, iMem);
        end
        function setPosition(this, iAgents, position, iMem)
            this.visualizers(iAgents).setPosition(position, iMem);
        end
    end
end