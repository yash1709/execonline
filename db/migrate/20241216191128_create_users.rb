class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :organization, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
