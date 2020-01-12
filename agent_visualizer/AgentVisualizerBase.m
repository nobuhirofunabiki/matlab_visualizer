classdef AgentVisualizerBase < VisualizerBase
    properties (SetAccess = protected)
        time_list
        position
    end

    methods (Access = protected)
        function obj = AgentVisualizerBase(args)
            obj.time_list = zeros(1,args.memory_size);
        end
    end

    methods (Abstract = true, Access = public)
        visualizeAgentTrajectory(this);
        visualizeAgentTrajectoryCustomized(this);
        visualizeAgentPosition(this);
        visualizeAgentPositionCustomized(this);
        visualizePositionDifference(this);
    end

    methods (Access = public)
        function setTimeList(this, time_stamp, iMem)
            this.time_list(:,iMem) = time_stamp;
        end
        function setPosition(this, arg_position, iMem)
            this.position(:,iMem) = arg_position;
        end
        function obj = getPosition(this)
            obj = this.position;
        end
    end

end