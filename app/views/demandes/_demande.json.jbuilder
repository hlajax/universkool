json.extract! demande, :id, :nom, :telephone, :email, :objet, :contenu, :created_at, :updated_at
json.url demande_url(demande, format: :json)
