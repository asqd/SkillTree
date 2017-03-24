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

    def search
      query = params[:query]
      @specialties = case
      when query.present?
        Specialty.where("profile ILIKE ? OR direction ILIKE ? OR code ILIKE ?", *["%#{query}%"]*3)
      else
        []
      end

      if query.present? && params[:human_levels].present?
        human_levels = params[:human_levels].map {|hl| "%#{hl}%"}
        @specialties = @specialties.where("human_level ILIKE ANY(array[?])", human_levels)
      end

      render json: @specialties
    end

    def disciplines
      @specialty = Specialty.find(params[:id])
      render json: @specialty.disciplines.with_links_by_params(specialty_id: params[:id]).map(&:attributes)
    end

    private
    def get_group_list
      grouped_directions = Specialty.directions.count(:direction).map(&:flatten).sort.group_by {|s| s[1]}
      @group_list = grouped_directions.reduce({}) {|hash, (k, v)| hash.merge({k => v.map{ |f| { direction: f[0], code: f[2], specialty_count: f[3]}}})}
    end

    def filter_params
      permitted_params = [:id, :dtype, :human_dtype, :direction, :level, :human_level, :study_form, :human_study_form, :created_at, :updated_at, :full_direction, :code, :profile, :qualification]

      params.slice(*permitted_params).permit(permitted_params)
    end

  end
end