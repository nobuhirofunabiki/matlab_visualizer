classdef EstimationAnalysisVisualizerBase < handle
    properties (SetAccess = protected)
        chi2
        estimate_error_position_scalar
        estimate_error_position_vector
        estimate_error_velocity_scalar
        estimate_error_velocity_vector
        diag_covmat_position
        diag_covmat_velocity
        estimate_performance_index
    end
    methods
        function obj = EstimationAnalysisVisualizerBase(args)
            obj.chi2 = args.chi2;
            memory_size = args.memory_size;
            obj.estimate_error_position_scalar   = zeros(1,memory_size);
            obj.estimate_error_velocity_scalar   = zeros(1,memory_size);
            obj.diag_covmat_position             = zeros(1,memory_size);
            obj.diag_covmat_velocity             = zeros(1,memory_size);
        end

        % Setters
        function setEstimateErrorPositionScalar(this, position_true, position_est, iMem)
            this.estimate_error_position_scalar(1,iMem) = norm(position_est - position_true);
        end
        function setEstimateErrorPositionVector(this, position_true, position_est, iMem)
            this.estimate_error_position_vector(:,iMem) = position_est - position_true;
        end
        function setEstimateErrorVelocityScalar(this, velocity_true, velocity_est, iMem)
            this.estimate_error_velocity_scalar(1,iMem) = norm(velocity_est - velocity_true);
        end
        function setEstimateErrorVelocityVector(this, velocity_true, velocity_est, iMem)
            this.estimate_error_velocity_vector(:,iMem) = velocity_est - velocity_true;
        end

        % Getters
        function output = getEstimateErrorPositionScalar(this, iMem)
            output = this.estimate_error_position_scalar(1,iMem);
        end
        function output = getEstimateErrorPositionScalarAll(this)
            output = this.estimate_error_position_scalar;
        end
        function output = getEstimateErrorVelocityScalar(this, iMem)
            output = this.estimate_error_velocity_scalar(1,iMem);
        end
        function output = getEstimateErrorVelocityScalarAll(this)
            output = this.estimate_error_velocity_scalar;
        end
        function output = getPerformanceIndex(this, iMem)
            output = this.estimate_performance_index(:,iMem);
        end

        % Visualization functions
        function visualizeEstimateErrorPositionScalar(this, time_list, stamp)
            plot(time_list, this.estimate_error_position_scalar, stamp)
            hold on
        end
        function visualizeEstimateErrorVelocityScalar(this, time_list, stamp)
            plot(time_list, this.estimate_error_velocity_scalar, stamp)
            hold on
        end
        function visualizeEstimatePerformanceIndex(this, time_list, iVar, stamp)
            plot(time_list, this.estimate_performance_index(iVar,:), stamp);
            hold on
        end
        function visualizeDiagonalElementsOfCovmatPosition(this, time_list, stamp)
            plot(time_list, this.diag_covmat_position, stamp)
            hold on
        end

    end
end