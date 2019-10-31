class AddAdministrateurIdToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :administrateur_id, :integer
  end
end
