class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.text :text
      t.string :name
      t.integer :keyword_id
      t.integer :related_mechanic_id

      t.timestamps null: false
    end
  end
end
