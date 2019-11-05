classdef MultiEstimationAnalysisVisualizerBase < handle
    properties (SetAccess = protected)
        visualizers
    end
    methods
        function obj = MultiEstimationAnalysisVisualizerBase(args)
            
        end

        % Setters (Pass-through functions to EstimationAnalysisVisualizerBase)
        function setEstimateErrorPositionScalar(this, iAgents, position_true, position_est, iMem)
            this.visualizers(iAgents).setEstimateErrorPositionScalar(position_true, position_est, iMem);
        end
        function setEstimateErrorPositionVector(this, iAgents, position_true, position_est, iMem)
            this.visualizers(iAgents).setEstimateErrorPositionVector(position_true, position_est, iMem);
        end
        function setEstimateErrorVelocityScalar(this, iAgents, velocity_true, velocity_est, iMem)
            this.visualizers(iAgents).setEstimateErrorVelocityScalar(velocity_true, velocity_est, iMem);
        end
        function setEstimateErrorVelocityVector(this, iAgents, velocity_true, velocity_est, iMem)
            this.visualizers(iAgents).setEstimateErrorVelocityVector(velocity_true, velocity_est, iMem);
        end

        % Getters (Pass-through functions to EstimationAnalysisVisualizerBase)
        function output = getEstimateErrorPositionScalar(this, iAgents, iMem)
            output = this.visualizers(iAgents).getEstimateErrorPositionScalar(iMem);
        end
        function output = getEstimateErrorVelocityScalar(this, iAgents, iMem)
            output = this.visualizers(iAgents).getEstimateErrorVelocityScalar(iMem);
        end
        function output = getPerformanceIndex(this, iAgents, iMem)
            output = this.visualizers(iAgents).getPerformanceIndex(iMem);
        end

        % Visualization functions (Pass-through functions to EstimationAnalysisVisualizerBase)
        function visualizeEstimateErrorPositionScalar(this, iAgents, time_list, stamp)
            this.visualizers(iAgents).visualizeEstimateErrorPositionScalar(time_list, stamp);
        end
        function visualizeEstimateErrorVelocityScalar(this, iAgents, time_list, stamp)
            this.visualizers(iAgents).visualizeEstimateErrorVelocityScalar(time_list, stamp);
        end
        function visualizeEstimatePerformanceIndex(this, iAgents, time_list, iVar, stamp)
            this.visualizers(iAgents).visualizeEstimatePerformanceIndex(time_list, iVar, stamp);
        end

    end
end