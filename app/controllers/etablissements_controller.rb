class EtablissementsController < ApplicationController
  before_action :set_etablissement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_administrateur!, except:[:index, :show]
  # GET /etablissements
  # GET /etablissements.json
def index
    (@filterrific = initialize_filterrific(
      Etablissement,
      params[:filterrific],
      select_options: {
        sorted_by: Etablissement.options_for_sorted_by,
        with_country_id: Country.options_for_select,
		with_category_id: Category.options_for_select,
      },
    )) || return
    @etablissements = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end
	
	
  def search
    #@etablissements = Etablissement.all
	if params[:category].blank?
	@q = Etablissement.ransack(params[:q])
    @etablissements = @q.result(distinct: true)
	else
		@category_id = Category.find_by(titre: params[:category]).id
		@etablissements = Etablissement.where(category_id: @category_id).order("created_at DESC")
	end
  end

  # GET /etablissements/1
  # GET /etablissements/1.json
  def show
	  @etablissements_similaires = Etablissement.where(category_id: @etablissement.category_id).limit(6).order("created_at DESC")
  end

  # GET /etablissements/new
  def new
    @etablissement = current_administrateur.etablissements.build
  end

  # GET /etablissements/1/edit
  def edit
  end

  # POST /etablissements
  # POST /etablissements.json
  def create
    @etablissement = current_administrateur.etablissements.build(etablissement_params)

    respond_to do |format|
      if @etablissement.save
        format.html { redirect_to @etablissement, notice: 'Etablissement was successfully created.' }
        format.json { render :show, status: :created, location: @etablissement }
      else
        format.html { render :new }
        format.json { render json: @etablissement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etablissements/1
  # PATCH/PUT /etablissements/1.json
  def update
    respond_to do |format|
      if @etablissement.update(etablissement_params)
        format.html { redirect_to @etablissement, notice: 'Etablissement was successfully updated.' }
        format.json { render :show, status: :ok, location: @etablissement }
      else
        format.html { render :edit }
        format.json { render json: @etablissement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etablissements/1
  # DELETE /etablissements/1.json
  def destroy
    @etablissement.destroy
    respond_to do |format|
      format.html { redirect_to etablissements_url, notice: 'Etablissement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etablissement
      @etablissement = Etablissement.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etablissement_params
      params.require(:etablissement).permit(:nom, :description, :profil, :cover, :telephone, :email, :site, :adresse,  :country_id, :category_id, :administrateur_id, {photos: []})
    end
end
