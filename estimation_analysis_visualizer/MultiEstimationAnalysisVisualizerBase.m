classdef MultiEstimationAnalysisVisualizerBase < handle
    properties (Abstract = true, SetAccess = protected)
        visualizers
        num_agents
    end

    methods (Access = protected)
        function obj = MultiEstimationAnalysisVisualizerBase(args)
            
        end
    end

    methods (Access = public)
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
        function visualizeDiagonalElementsOfCovmatPosition(this, iAgents, time_list, stamp)
            this.visualizers(iAgents).visualizeDiagonalElementsOfCovmatPosition(time_list, stamp);
        end

        function visualizePositionErrorAll(this, ...
            time_list, line_color, line_style, line_width)
            
            hold on
            color_list = colormap(jet(this.num_agents));
            for iAgents = 1:this.num_agents
                line_color = color_list(iAgents,:);
                position_errors = this.visualizers(iAgents).getEstimateErrorPositionScalarAll();
                plot(time_list, position_errors, ...
                    'Color', line_color, ...
                    'LineStyle', line_style, ...
                    'LineWidth', line_width);
            end
        end

        function [plot_mean, plot_variance] = visualizePositionErrorWithMeanAndVariance(this, ...
            time_list, line_color, line_style, line_width)

            data_size = size(this.visualizers(1).getEstimateErrorPositionScalarAll());
            mean_position = zeros(data_size);
            sum_positions = zeros(data_size);
            standard_deviation = zeros(data_size);
            all_position_errors = zeros(this.num_agents, length(time_list));
            for iAgents = 1:this.num_agents
                sum_positions = sum_positions + ...
                    this.visualizers(iAgents).getEstimateErrorPositionScalarAll();
                all_position_errors(iAgents,:) = this.visualizers(iAgents).getEstimateErrorPositionScalarAll();
            end
            mean_position = sum_positions/this.num_agents;
            for iSteps = 1:length(time_list)
                standard_deviation(1,iSteps) = sqrt(var(all_position_errors(:,iSteps)));
            end
            time_list_agg = [time_list, fliplr(time_list)];
            in_between = [mean_position-standard_deviation, fliplr(mean_position+standard_deviation)];
            hold on
            plot_variance = fill(time_list_agg, in_between, ...
                line_color, ...
                'FaceAlpha', 0.3, ...
                'EdgeColor', 'none');
            plot_mean = plot(time_list, mean_position, ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
        end

        function [plot_mean, plot_variance] = visualizeVelocityErrorWithMeanAndVariance(this, ...
            time_list, line_color, line_style, line_width)

            data_size = size(this.visualizers(1).getEstimateErrorVelocityScalarAll());
            mean_velocity = zeros(data_size);
            sum_velocities = zeros(data_size);
            standard_deviation = zeros(data_size);
            all_velocity_errors = zeros(this.num_agents, length(time_list));
            for iAgents = 1:this.num_agents
                sum_velocities = sum_velocities + ...
                    this.visualizers(iAgents).getEstimateErrorVelocityScalarAll();
                all_velocity_errors(iAgents,:) = this.visualizers(iAgents).getEstimateErrorVelocityScalarAll();
            end
            mean_velocity = sum_velocities/this.num_agents;
            for iSteps = 1:length(time_list)
                standard_deviation(1,iSteps) = sqrt(var(all_velocity_errors(:,iSteps)));
            end
            time_list_agg = [time_list, fliplr(time_list)];
            in_between = [mean_velocity-standard_deviation, fliplr(mean_velocity+standard_deviation)];
            hold on
            plot_variance = fill(time_list_agg, in_between, ...
                line_color, ...
                'FaceAlpha', 0.3, ...
                'EdgeColor', 'none');
            plot_mean = plot(time_list, mean_velocity, ...
                'Color', line_color, ...
                'LineStyle', line_style, ...
                'LineWidth', line_width);
        end
    end

end