class Country < ApplicationRecord
	def self.options_for_select
    countries = Country.arel_table
    # order('LOWER(name)').map { |e| [e.name, e.id] }
    order(countries[:nom].lower).pluck(:nom, :id)
  end
	  extend FriendlyId
  friendly_id :nom, use: :slugged
	has_many :etablissements
	belongs_to :administrateur
end
