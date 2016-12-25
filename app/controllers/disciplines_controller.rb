class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_specialties, only: [:by_specialty]
  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = Discipline.all
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: 'Discipline was successfully created.' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  def by_specialty
    @specialty_id = params[:id]
    respond_to do |format|
      format.html
      format.js
      format.json # { render json: @disciplines.as_json }
    end
  end
  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:name, :label)
    end

    def set_specialties
      # rewrite this on scopes in model
      base_query = LinkSpecialtyDiscipline.joins(:discipline).select("link_specialty_disciplines.*, disciplines.name || ' ' || disciplines.label as name, disciplines.id as d_id").where(link_specialty_disciplines: { specialty_id: params[:id] })

      natural_science_cond = "disciplines.label ILIKE '%-ЕНМ.%'"
      humanities_cond = "disciplines.label ILIKE '%-ГМ.%'"

      @natural_science_disciplines = to_strict(base_query.where(natural_science_cond).group_by(&:name).sort)
      @humanities_science_disciplines = to_strict(base_query.where(humanities_cond).group_by(&:name).sort)
      @special_disciplines = to_strict(base_query.where.not(natural_science_cond).where.not(humanities_cond).group_by(&:name).sort)
    # Discipline.joins(:link_specialty_disciplines).where(link_specialty_disciplines: { specialty_id: params[:id] })
    end

    def to_strict(ar_array)
      ar_array.map {|d| OpenStruct.new(id: d[1].first.try(:discipline_id), name: d[0], courses: d[1]) }
    end
end
