classdef EstimationAnalysisVisualizer2D < EstimationAnalysisVisualizerBase
    properties (SetAccess = protected)
        
    end
    methods
        function obj = EstimationAnalysisVisualizer2D(args)
            obj@EstimationAnalysisVisualizerBase(args);
            memory_size = args.memory_size;
            obj.estimate_error_position_vector  = zeros(2,memory_size);
            obj.estimate_error_velocity_vector  = zeros(2,memory_size);
            obj.estimate_performance_index      = zeros(4,memory_size);
        end

        % Utility funcitons
        function calculateEstimatePerformanceIndex(this, covariance_matrix, iMem)
            performance_index = zeros(4,1);
            est_err_position = this.estimate_error_position_vector(:,iMem);
            est_err_velocity = this.estimate_error_velocity_vector(:,iMem);
            for iVar = 1:2
                performance_index(iVar, 1) = est_err_position(iVar) - sqrt(this.chi2*covariance_matrix(iVar, iVar));
            end
            for iVar = 3:4
                performance_index(iVar, 1) = est_err_velocity(iVar-2) - sqrt(this.chi2*covariance_matrix(iVar, iVar));
            end
            this.estimate_performance_index(:,iMem) = performance_index;
        end
        
        % Setters
        function calculateDiagonalElementsOfCovarinaceMatrix(this, covariance_matrix, iMem)
            this.diag_covmat_position(1,iMem) = ...
                sqrt(this.chi2*(covariance_matrix(1, 1) + covariance_matrix(2, 2)));
            this.diag_covmat_position(1,iMem) = ...
                sqrt(this.chi2*(covariance_matrix(3, 3) + covariance_matrix(4, 4)));
        end

        % Visualization functions
        function visualizeEstimateErrorPositionScalarCustomized(this, time_list, style)
            line_color = style.line_color;
            line_style = style.line_style;
            line_width = style.line_width;
            plot (time_list, this.estimate_error_position_scalar, ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
            hold on
        end

        function visualizeEstimateErrorVelocityScalarCustomized(this, time_list, style)
            line_color = style.line_color;
            line_style = style.line_style;
            line_width = style.line_width;
            plot (time_list, this.estimate_error_velocity_scalar, ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
            hold on
        end

    end
end