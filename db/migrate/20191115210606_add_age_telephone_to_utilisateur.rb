class AddAgeTelephoneToUtilisateur < ActiveRecord::Migration[6.0]
  def change
    add_column :utilisateurs, :age, :string
    add_column :utilisateurs, :telephone, :string
  end
end
