class LinkSpecialtyDisciplinesController < ApplicationController
  before_action :set_link_specialty_discipline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  # GET /link_specialty_disciplines
  # GET /link_specialty_disciplines.json
  def index
    @link_specialty_disciplines = LinkSpecialtyDiscipline.all
  end

  # GET /link_specialty_disciplines/1
  # GET /link_specialty_disciplines/1.json
  def show
  end

  # GET /link_specialty_disciplines/new
  def new
    @link_specialty_discipline = LinkSpecialtyDiscipline.new
  end

  # GET /link_specialty_disciplines/1/edit
  def edit
  end

  # POST /link_specialty_disciplines
  # POST /link_specialty_disciplines.json
  def create
    @link_specialty_discipline = LinkSpecialtyDiscipline.new(link_specialty_discipline_params)

    respond_to do |format|
      if @link_specialty_discipline.save
        format.html { redirect_to @link_specialty_discipline, notice: 'Link specialty discipline was successfully created.' }
        format.json { render :show, status: :created, location: @link_specialty_discipline }
      else
        format.html { render :new }
        format.json { render json: @link_specialty_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /link_specialty_disciplines/1
  # PATCH/PUT /link_specialty_disciplines/1.json
  def update
    respond_to do |format|
      if @link_specialty_discipline.update(link_specialty_discipline_params)
        format.html { redirect_to @link_specialty_discipline, notice: 'Link specialty discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @link_specialty_discipline }
      else
        format.html { render :edit }
        format.json { render json: @link_specialty_discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_specialty_disciplines/1
  # DELETE /link_specialty_disciplines/1.json
  def destroy
    @link_specialty_discipline.destroy
    respond_to do |format|
      format.html { redirect_to link_specialty_disciplines_url, notice: 'Link specialty discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_specialty_discipline
      @link_specialty_discipline = LinkSpecialtyDiscipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_specialty_discipline_params
      params.require(:link_specialty_discipline).permit(:term, :htype, :human_htype, :specialty_id, :discipline_id)
    end
end
