class AddAdministrateurIdToEtablissement < ActiveRecord::Migration[6.0]
  def change
    add_column :etablissements, :administrateur_id, :integer
  end
end
