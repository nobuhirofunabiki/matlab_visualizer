classdef MultiEstimationAnalysisVisualizer2D < MultiEstimationAnalysisVisualizerBase
    properties (SetAccess = protected)
    end
    methods
        function obj = MultiEstimationAnalysisVisualizer2D(obj,args)
            num_agents = args.num_agents;
            args_visualizer.id = args.id;
            args_visualizer.chi = args.chi;
            args_visualizer.memory_size = args.memory_size;
            for iAgents = 1:num_agents
                visualizers(iAgents) ...
                    = EstimationAnalysisVisualizer2D(args_visualizer);
            end
            obj.visualizers = visualizers;
        end

        % Utility functions (Pass-through functions to EstimationAnalysisVisualizer2D)
        function calculateEstimatePerformanceIndex(this, iAgents, covariance_matrix, iMem)
            this.visualizers(iAgents).calculateEstimatePerformanceIndex(covariance_matrix, iMem);
        end
    end
end