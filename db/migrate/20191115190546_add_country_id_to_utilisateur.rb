class AddCountryIdToUtilisateur < ActiveRecord::Migration[6.0]
  def change
    add_column :utilisateurs, :country_id, :integer
  end
end
