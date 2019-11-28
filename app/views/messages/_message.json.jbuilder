json.extract! message, :id, :nom, :email, :telephone, :ville, :contenu, :created_at, :updated_at
json.url message_url(message, format: :json)
