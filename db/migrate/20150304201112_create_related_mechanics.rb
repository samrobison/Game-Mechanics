class CreateRelatedMechanics < ActiveRecord::Migration
  def change
    create_table :related_mechanics do |t|
      t.string :url
      t.string :title

      t.timestamps null: false
    end
  end
end
