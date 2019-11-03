classdef AgentVisualizerBase < VisualizerBase
    properties (SetAccess = protected)
        time_list
        position
    end
    methods
        function obj = AgentVisualizerBase(args)
            obj.time_list = zeros(1,args.memory_size);
        end
        function setTimeList(this, time_stamp)
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