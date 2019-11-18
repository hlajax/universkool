class AccueilController < ApplicationController
  def index
	  @etablissements = Etablissement.all.limit(8).order("created_at desc")
	  @articles = Article.all.limit(6).order("created_at desc")
  end
end
