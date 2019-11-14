class AccueilController < ApplicationController
  def index
	  @q = Etablissement.ransack(params[:q])
  	  @etablissement = @q.result(distinct: true)
	  @articles = Article.all.limit(6).order("created_at desc")
  end
end
