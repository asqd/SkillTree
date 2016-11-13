class AssignmentSpecialtyDisciplinesController < ApplicationController
  before_action :set_assignment_specialty_discipline, only: [:show, :edit, :update, :destroy]

  # GET /assignment_specialty_disciplines
  # GET /assignment_specialty_disciplines.json
  def index
    @assignment_specialty_disciplines = AssignmentSpecialtyDiscipline.all
  end

  # GET /assignment_specialty_disciplines/1
  # GET /assignment_specialty_disciplines/1.json
  def show
  end

  # GET /assignment_specialty_disciplines/new
  def new
    @assignment_specialty_discipline = AssignmentSpecialtyDiscipline.new
  end

  # GET /assignment_specialty_disciplines/1/edit
  def edit
  end

  # POST /assignment_specialty_disciplines
  # POST /assignment_specialty_disciplines.json
  def create
    @assignment_specialty_discipline = AssignmentSpecialtyDiscipline.new(assignment_specialty_discipline_params)

    respond_to do |format|
      if @assignment_specialty_discipline.save
        format.html { redirect_to @assignment_specialty_discipline, notice: 'Assignment specialty discipline was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_specialty_discipline }
      else
        format.html { render :new }
        format.json { render json: @assignment_specialty_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_specialty_disciplines/1
  # PATCH/PUT /assignment_specialty_disciplines/1.json
  def update
    respond_to do |format|
      if @assignment_specialty_discipline.update(assignment_specialty_discipline_params)
        format.html { redirect_to @assignment_specialty_discipline, notice: 'Assignment specialty discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_specialty_discipline }
      else
        format.html { render :edit }
        format.json { render json: @assignment_specialty_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_specialty_disciplines/1
  # DELETE /assignment_specialty_disciplines/1.json
  def destroy
    @assignment_specialty_discipline.destroy
    respond_to do |format|
      format.html { redirect_to assignment_specialty_disciplines_url, notice: 'Assignment specialty discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_specialty_discipline
      @assignment_specialty_discipline = AssignmentSpecialtyDiscipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_specialty_discipline_params
      params.require(:assignment_specialty_discipline).permit(:specialty_id, :discipline_id, :term, :report)
    end
end
