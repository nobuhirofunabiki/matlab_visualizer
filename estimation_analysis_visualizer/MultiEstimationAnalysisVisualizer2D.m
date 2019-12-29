classdef MultiEstimationAnalysisVisualizer2D < MultiEstimationAnalysisVisualizerBase
    properties (SetAccess = protected)
        visualizers
        num_agents
    end

    methods
        function obj = MultiEstimationAnalysisVisualizer2D(args)
            obj.num_agents = args.num_agents;
            args_visualizer.chi2 = args.chi2;
            args_visualizer.memory_size = args.memory_size;
            for iAgents = 1:obj.num_agents
                visualizers(iAgents) ...
                    = EstimationAnalysisVisualizer2D(args_visualizer);
            end
            obj.visualizers = visualizers;
        end

        % Utility functions (Pass-through functions to EstimationAnalysisVisualizer2D)
        function calculateEstimatePerformanceIndex(this, iAgents, covariance_matrix, iMem)
            this.visualizers(iAgents).calculateEstimatePerformanceIndex(covariance_matrix, iMem);
        end

        % Setters
        function calculateDiagonalElementsOfCovarinaceMatrix(this, iAgents, covariance_matrix, iMem)
            this.visualizers(iAgents).calculateDiagonalElementsOfCovarinaceMatrix(covariance_matrix, iMem);
        end
    end
end