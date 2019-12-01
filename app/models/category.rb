class Category < ApplicationRecord
	
def self.options_for_select
    categories = Category.arel_table
    # order('LOWER(name)').map { |e| [e.name, e.id] }
    order(categories[:titre].lower).pluck(:titre, :id)
  end
	
	  extend FriendlyId
  friendly_id :titre, use: :slugged
	has_many :etablissements
	belongs_to :administrateur
end
