class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :nom
      t.string :email
      t.string :telephone
      t.string :ville
      t.text :contenu

      t.timestamps
    end
  end
end
