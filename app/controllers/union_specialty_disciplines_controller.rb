class UnionSpecialtyDisciplinesController < ApplicationController
  before_action :set_union_specialty_discipline, only: [:show, :edit, :update, :destroy]

  # GET /union_specialty_disciplines
  # GET /union_specialty_disciplines.json
  def index
    @union_specialty_disciplines = UnionSpecialtyDiscipline.all
  end

  # GET /union_specialty_disciplines/1
  # GET /union_specialty_disciplines/1.json
  def show
  end

  # GET /union_specialty_disciplines/new
  def new
    @union_specialty_discipline = UnionSpecialtyDiscipline.new
  end

  # GET /union_specialty_disciplines/1/edit
  def edit
  end

  # POST /union_specialty_disciplines
  # POST /union_specialty_disciplines.json
  def create
    @union_specialty_discipline = UnionSpecialtyDiscipline.new(union_specialty_discipline_params)

    respond_to do |format|
      if @union_specialty_discipline.save
        format.html { redirect_to @union_specialty_discipline, notice: 'Union specialty discipline was successfully created.' }
        format.json { render :show, status: :created, location: @union_specialty_discipline }
      else
        format.html { render :new }
        format.json { render json: @union_specialty_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /union_specialty_disciplines/1
  # PATCH/PUT /union_specialty_disciplines/1.json
  def update
    respond_to do |format|
      if @union_specialty_discipline.update(union_specialty_discipline_params)
        format.html { redirect_to @union_specialty_discipline, notice: 'Union specialty discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @union_specialty_discipline }
      else
        format.html { render :edit }
        format.json { render json: @union_specialty_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /union_specialty_disciplines/1
  # DELETE /union_specialty_disciplines/1.json
  def destroy
    @union_specialty_discipline.destroy
    respond_to do |format|
      format.html { redirect_to union_specialty_disciplines_url, notice: 'Union specialty discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_union_specialty_discipline
      @union_specialty_discipline = UnionSpecialtyDiscipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def union_specialty_discipline_params
      params.require(:union_specialty_discipline).permit(:specialty_id, :discipline_id, :term, :report)
    end
end
