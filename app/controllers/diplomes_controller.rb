class DiplomesController < ApplicationController
  before_action :set_diplome, only: [:show, :edit, :update, :destroy]

  # GET /diplomes
  # GET /diplomes.json
  def index
    @diplomes = Diplome.all
  end

  # GET /diplomes/1
  # GET /diplomes/1.json
  def show
  end

  # GET /diplomes/new
  def new
    @diplome = Diplome.new
  end

  # GET /diplomes/1/edit
  def edit
  end

  # POST /diplomes
  # POST /diplomes.json
  def create
    @diplome = Diplome.new(diplome_params)

    respond_to do |format|
      if @diplome.save
        format.html { redirect_to @diplome, notice: 'Diplome was successfully created.' }
        format.json { render :show, status: :created, location: @diplome }
      else
        format.html { render :new }
        format.json { render json: @diplome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diplomes/1
  # PATCH/PUT /diplomes/1.json
  def update
    respond_to do |format|
      if @diplome.update(diplome_params)
        format.html { redirect_to @diplome, notice: 'Diplome was successfully updated.' }
        format.json { render :show, status: :ok, location: @diplome }
      else
        format.html { render :edit }
        format.json { render json: @diplome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diplomes/1
  # DELETE /diplomes/1.json
  def destroy
    @diplome.destroy
    respond_to do |format|
      format.html { redirect_to diplomes_url, notice: 'Diplome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diplome
      @diplome = Diplome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diplome_params
      params.require(:diplome).permit(:titre, :description)
    end
end
