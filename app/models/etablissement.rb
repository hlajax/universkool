class Etablissement < ApplicationRecord
		  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_country_id
                with_category_id
                with_created_at_gte
              ]

  # default for will_paginate
  self.per_page = 10
	
  mount_uploader :cover, CoverUploader
  mount_uploader :profil, LogoUploader
  mount_uploader :photos, PhotoUploader
    extend FriendlyId
  friendly_id :nom, use: :slugged
  belongs_to :country
  belongs_to :category
  belongs_to :administrateur
  belongs_to :diplome
	
	
  scope :search_query, ->(query) {
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(etablissements.nom) LIKE ?",
          "LOWER(etablissements.nom) LIKE ?",
          "LOWER(etablissements.nom) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, ->(sort_option) {
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    etablissements = Etablissement.arel_table
    countries = Country.arel_table
	 categories = Category.arel_table
    case sort_option.to_s
    when /^created_at_/
      # order("etablissements.created_at #{direction}")
      order(etablissements[:created_at].send(direction))
    when /^nom_/
      # order("LOWER(etablissements.last_nom) #{direction}, LOWER(etablissements.first_nom) #{direction}")
      order(etablissements[:nom].lower.send(direction))
    when /^country_nom_/
      # order("LOWER(countries.nom) #{ direction }").includes(:country)
      Etablissement.joins(:country).order(countries[:nom].lower.send(direction)).order(etablissements[:nom].lower.send(direction))
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  scope :with_country_id, ->(country_ids) {
    where(:country_id => [*country_ids])
  }
	
scope :with_category_id, ->(category_ids) {
    where(:category_id => [*category_ids])
  }

  scope :with_created_at_gte, ->(ref_date) {
    where('etablissements.created_at >= ?', ref_date)
  }

  delegate :nom, :to => :country, :prefix => true

  def self.options_for_sorted_by
    [
      ['nom des écoles (de a à z)', 'nom_asc'],
      #['Registration date (newest first)', 'created_at_desc'],
      #['Registration date (oldest first)', 'created_at_asc'],
      ['nom des pays  (de a à z)', 'country_nom_asc']
    ]
  end

  def full_nom
    [nom].compact.join(', ')
  end

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end
	
	
	
	
	
	
	
end
