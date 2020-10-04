classdef EstimationAnalysisVisualizer < EstimationAnalysisVisualizerBase
    properties (SetAccess = protected)
        num_dimensions
    end
    methods
        function obj = EstimationAnalysisVisualizer(args)
            obj@EstimationAnalysisVisualizerBase(args);
            obj.num_dimensions = args.num_dimensions;
            memory_size = args.memory_size;
            obj.estimate_error_position_vector  = zeros(obj.num_dimensions,memory_size);
            obj.estimate_error_velocity_vector  = zeros(obj.num_dimensions,memory_size);
            obj.estimate_performance_index      = zeros(2*obj.num_dimensions,memory_size);
        end

        % Utility funcitons
        function calculateEstimatePerformanceIndex(this, covariance_matrix, iMem)
            performance_index = zeros(this.num_dimensions,1);
            est_err_position = this.estimate_error_position_vector(:,iMem);
            est_err_velocity = this.estimate_error_velocity_vector(:,iMem);
            for iDims = 1:this.num_dimensions
                performance_index(iDims, 1) = est_err_position(iDims) - sqrt(this.chi2*covariance_matrix(iDims, iDims));
            end
            for iDims = this.num_dimensions+1:2*this.num_dimensions
                performance_index(iDims, 1) = est_err_velocity(iDims-2) - sqrt(this.chi2*covariance_matrix(iDims, iDims));
            end
            this.estimate_performance_index(:,iMem) = performance_index;
        end
        
        % Setters
        function calculateDiagonalElementsOfCovarinaceMatrix(this, covariance_matrix, iMem)
            num_dims = this.num_dimensions;
            position_variance = 0;
            velocity_variance = 0;
            for iDims = 1:num_dims
                position_variance = position_variance + covariance_matrix(iDims, iDims);
                velocity_variance = velocity_variance + covariance_matrix(num_dims+iDims, num_dims+iDims);
            end
            this.diag_covmat_position(1,iMem) = sqrt(this.chi2*(position_variance));
            this.diag_covmat_velocity(1,iMem) = sqrt(this.chi2*(velocity_variance));
        end

        % Visualization functions
        function output = visualizeEstimateErrorPositionScalarCustomized(this, time_list, style)
            line_color = style.line_color;
            line_style = style.line_style;
            line_width = style.line_width;
            output = plot(time_list, this.estimate_error_position_scalar, ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
            hold on
        end

        function output = visualizeEstimateErrorVelocityScalarCustomized(this, time_list, style)
            line_color = style.line_color;
            line_style = style.line_style;
            line_width = style.line_width;
            output = plot(time_list, this.estimate_error_velocity_scalar, ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
            hold on
        end

    end
end