class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
