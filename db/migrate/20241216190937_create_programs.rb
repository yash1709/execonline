class CreatePrograms < ActiveRecord::Migration[8.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
