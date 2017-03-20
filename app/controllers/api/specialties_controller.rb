module Api
  class SpecialtiesController < ApplicationController

    before_action :get_group_list, only: :group_list
    def index
      filter = filter_params
      render json: Specialty.where(filter)
    end

    def group_list
      render json: @group_list

    end

    def disciplines
      @specialty = Specialty.find(params[:id])
      render json: @specialty.disciplines
    end

    private
    def get_group_list
      grouped_directions = Specialty.directions.pluck(:direction, :human_level, :code).sort.group_by {|s| s[1]}
      @group_list = grouped_directions.reduce({}) {|hash, (k, v)| hash.merge({k => v.map{ |f| { direction: f[0], code: f[2], specialty_count: Specialty.where(direction: f[0], human_level: f[1]).count}}})}
    end

    def filter_params
      permitted_params = [:id, :dtype, :human_dtype, :direction, :level, :human_level, :study_form, :human_study_form, :created_at, :updated_at, :full_direction, :code, :profile, :qualification]

      params.slice(*permitted_params).permit(permitted_params)
    end
  end
end