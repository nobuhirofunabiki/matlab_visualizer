classdef MultiEstimationAnalysisVisualizer < MultiEstimationAnalysisVisualizerBase
    properties (SetAccess = protected)
        visualizers
        num_agents
    end

    methods
        function obj = MultiEstimationAnalysisVisualizer(args)
            obj.num_agents = args.num_agents;
            args_visualizer.chi2 = args.chi2;
            args_visualizer.memory_size = args.memory_size;
            args_visualizer.num_dimensions = args.num_dimensions;
            for iAgents = 1:obj.num_agents
                visualizers(iAgents) ...
                    = EstimationAnalysisVisualizer(args_visualizer);
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