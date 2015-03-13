class CreateRelatedMechanics < ActiveRecord::Migration
  def change
    create_table :related_mechanics do |t|
      t.string :title
      t.string :description
      t.integer :mechanic_id, null: false

      t.timestamps null: false
    end
  end
end
