class AccueilController < ApplicationController
  def index
	  @q = Etablissement.ransack(params[:q])
  	  @etablissement = @q.result(distinct: true)
  end
end
