class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.text :text
      t.string :title
      t.string :link
      t.integer :mechanic_id, null:false

      t.timestamps null: false
    end
  end
end
