classdef MultiAgentVisualizer3D < MultiAgentVisualizerBase
    properties (SetAccess = protected)
    end
    methods
        function obj = MultiAgentVisualizer3D(args)
            num_agents = args.num_agents;
            args_visualizer.memory_size = args.memory_size;
            for iAgents = 1:num_agents
                visualizers_(iAgents) = AgentVisualizer3D(args_visualizer);
            end
            obj.visualizers_ = visualizers_;
        end

        % Visualzation (Pass-through functions to AgentVisualizer3D)
        function output = visualizeAgentTrajectory(this, iAgents, symbol)
            output = this.visualizers_(iAgents).visualizeAgentTrajectory(symbol);
        end
        function output = visualizeAgentTrajectoryCustomized(this, iAgents, args)
            output = this.visualizers_(iAgents).visualizeAgentTrajectoryCustomized(args);
        end
        function output = visualizeAgentPosition(this, iAgents, stamp, symbol, b_filled)
            output = this.visualizers_(iAgents).visualizeAgentPosition(...
                stamp, symbol, b_filled);
        end
        function output = visualizeAgentPositionCustomized(this, iAgents, stamp, args)
            output = this.visualizers_(iAgents).visualizeAgentPositionCustomized(stamp, args);
        end
        function output = visualizeAgentPositionWithText(this, iAgents, stamp, symbol, b_filled, txt)
            output = this.visualizers_(iAgents).visualizeAgentPositionWithText(...
                stamp, symbol, b_filled, txt);
        end
        % Setters (Pass-through functions to AgentVisualizer3D)
        function setTimeList(this, iAgents, time_stamp, iMem)
            this.visualizers_(iAgents).setTimeList(time_stamp, iMem);
        end
        function setPosition(this, iAgents, position, iMem)
            this.visualizers_(iAgents).setPosition(position, iMem);
        end
    end
end