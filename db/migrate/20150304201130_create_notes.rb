class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.integer :mechanic_id, null: false

      t.timestamps null: false
    end
  end
end
