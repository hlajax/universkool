json.extract! etablissement, :id, :nom, :description, :profil, :cover, :telephone, :email, :site, :adresse, :slug, :country_id, :category_id, :created_at, :updated_at
json.url etablissement_url(etablissement, format: :json)
