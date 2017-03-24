module Api
  class DisciplinesController < ApplicationController
    before_action :check_params
    def index
      render json: @disciplines.to_json(methods: [:human_label, :sorted_short_htype])
    end

    def check_params
      @disciplines = if params.include?('specialty_id')
        Discipline.with_links_by_params(specialty_id: params[:specialty_id], term_number: params[:term_number])
      else
        Discipline.with_links
      end
    end
  end
end