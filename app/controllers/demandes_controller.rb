class DemandesController < ApplicationController
  before_action :set_demande, only: [:show, :edit, :update, :destroy]

  # GET /demandes
  # GET /demandes.json
  def index
    @demandes = Demande.all
  end

  # GET /demandes/1
  # GET /demandes/1.json
  def show
  end

  # GET /demandes/new
  def new
    @demande = Demande.new
  end

  # GET /demandes/1/edit
  def edit
  end

  # POST /demandes
  # POST /demandes.json
  def create
    @demande = Demande.new(demande_params)

    respond_to do |format|
      if @demande.save
        format.html { redirect_to @demande, notice: 'Votre demande a été envoyée !' }
        format.json { render :show, status: :created, location: @demande }
      else
        format.html { render :new }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demandes/1
  # PATCH/PUT /demandes/1.json
  def update
    respond_to do |format|
      if @demande.update(demande_params)
        format.html { redirect_to @demande, notice: 'Demande was successfully updated.' }
        format.json { render :show, status: :ok, location: @demande }
      else
        format.html { render :edit }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demandes/1
  # DELETE /demandes/1.json
  def destroy
    @demande.destroy
    respond_to do |format|
      format.html { redirect_to demandes_url, notice: 'Demande was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demande
      @demande = Demande.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demande_params
      params.require(:demande).permit(:nom, :telephone, :email, :objet, :contenu)
    end
end
