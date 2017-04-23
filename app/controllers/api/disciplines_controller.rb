module Api
  class DisciplinesController < ApplicationController
    before_action :check_params, only: :index
    before_action :get_disciplines, only: :compare

    def index
      render json: @disciplines.sort{ |a, b| [a.human_label, a.name] <=> [b.human_label, b.name] }.to_json(methods: [:human_label, :sorted_short_htype])
    end

    def compare
      render json: {
        similar: JSON.parse(@similar.sort{ |a, b| [a.human_label, a.name] <=> [b.human_label, b.name] }.to_json(methods: [:human_label, :sorted_short_htype])),
        different: JSON.parse(@different.sort{ |a, b| [a.human_label, a.name] <=> [b.human_label, b.name] }.to_json(methods: [:human_label, :sorted_short_htype])) }
    end

    def check_params
      @disciplines = if params.include?('specialty_id')
        Discipline.with_links_by_params(specialty_id: params[:specialty_id], term_number: params[:term_number])
      else
        Discipline.with_links
      end
    end

    def get_disciplines
      disciplines = Discipline.compare(params[:specialty_ids], params[:term_number])
      @similar = disciplines.select { |discipline| discipline['first'].present? && discipline['second'].present? }
      @different = disciplines.select { |discipline| discipline['first'].blank? || discipline['second'].blank? }
    end
  end
end