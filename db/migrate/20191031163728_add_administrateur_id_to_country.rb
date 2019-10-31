class AddAdministrateurIdToCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :administrateur_id, :integer
  end
end
